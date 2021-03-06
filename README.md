# pepys

Ruby Logger outputting JSON logs. Inspired by & compatible with [node-bunyan](https://github.com/trentm/node-bunyan)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pepys'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pepys

## Usage

```ruby
require "pepys"

logger = Pepys::Logger.new("example_script", STDOUT)
logger.info "Example script started"
logger.fatal "Example script aborted due to lack of code"
# >> {"name":"example_script","pid":36279,"hostname":"Thrax","level":30,"time":"2016-09-15T22:48:30Z","msg":"Example script started","v":0}
# >> {"name":"example_script","pid":36279,"hostname":"Thrax","level":60,"time":"2016-09-15T22:48:30Z","msg":"Example script aborted due to lack of code","v":0}

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/caius/pepys. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
