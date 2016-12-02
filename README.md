# TravisSkipper




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

```ruby
TravisSkipper.configure do |config|
  config.travis.token = # Token from travis
  config.repository.name = # repository name, eg 'infakt/travis_skipper'
  config.repository.branches = # branches on which we want to let jobs run
  config.logger.path = # path to log file
end

TravisSkipper::Listener.start
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/infakt/travis_skipper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

