require 'travis'

module TravisSkipper
  class Listener

    class << self
      def start
        new.start
      end
    end

    def initialize
      Travis::Pro.access_token = config.travis.token
    end

    def start
      Travis::Pro.listen(repo) do |stream|
        logger.log("starts..")
        stream.on('build:created') do |event|
          logger.log("build: ##{event.build.number}")

          if event.build.pull_request?
            handle_pr(event)
          else
            handler_branch(event)
          end
        end
      end
    end

    private
    attr_reader :logger

    def repo
      @repo ||= Travis::Pro::Repository.find(config.repository.name)
    end

    def config
      TravisSkipper.config
    end

    def logger
      @logger ||= TravisSkipper::Logger.new
    end

    def handle_pr(event)
      cancel_after(event) do |build, other_build|
        other_build.pull_request? && other_build.pull_request_number == build.pull_request_number
      end
    end

    def handler_branch(event)
      if config.repository.branches.include?(event.build.commit.branch)
        cancel_after(event) do |build, other_build|
          !other_build.pull_request? && other_build.commit.branch == build.commit.branch
        end
      else
        cancel(build: event.build)
      end
    end

    def cancel_after(event, &block)
      repo.builds(after_number: event.build.number).each do | build|
        if block.call(event.build, build)
          cancel(build: build)
        end
      end
    end

    def cancel(build:)
      unless build.running?
        logger.log("build canceled: ##{build.number}")
        build.cancel
      end
    rescue Travis::Client::ValidationFailed
    end
  end
end
