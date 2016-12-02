require 'dry-configurable'
require "travis_skipper/version"
require "travis_skipper/logger"
require "travis_skipper/listener"

module TravisSkipper
  extend Dry::Configurable

  setting :travis do
    setting :token
  end

  setting :repository do
    setting :name
    setting :branches, %w(master)
  end

  setting :logger do
    setting :path
  end
end
