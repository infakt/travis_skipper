require 'logger'

module TravisSkipper
  class Logger
    def initialize
      @logger = ::Logger.new('travis_skipper.log', 'daily')
    end

    def log(txt)
      logger.debug(txt)
    end

    private

    attr_reader :logger
  end
end
