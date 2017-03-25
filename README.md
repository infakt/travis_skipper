# Travis Auto Cancellation

There is no need for that gem anymore, Travis introduced [Auto Cancellation](https://blog.travis-ci.com/2017-03-22-introducing-auto-cancellation)

# TravisSkipper

TravisSkipper allows you to build only newset changes on PRs, and Branches. When you push many commits to repo TS will cancel all build besides newest one on each branch/PR. It also cancels builds on a branch if this branch is used in PR.

Internally it listen to Travis [events](https://github.com/travis-ci/travis.rb#listening-for-events) for given repo and cancels previous builds for each newone.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'travis_skipper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install travis_skipper

## Usage

You need to set proper configuration and start up a listener. To run it in the background you can use [daemons] (https://rubygems.org/gems/daemons) gem.

```ruby
TravisSkipper.configure do |config|
  config.travis.token = "XXX" # Token from travis
  config.repository.name = "infakt/travis_skipper" # repository name
  config.repository.branches = %w(master) # branches on which we want to let jobs run
  config.logger.path = "logs/skipper.log" # path to log file
end

TravisSkipper::Listener.start
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/infakt/travis_skipper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
