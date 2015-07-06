# Furious

Super-simple tool to package and upload gems to Gemfury.

## Installation

Add this line to your gem's .gemspec:

```ruby
Gem::Specification.new do |spec|
  # ...
  spec.add_development_dependency 'furious'
end
```

## Usage

- `furious package` - build a gem package
- `furious tag` - tags the version in the Git repository
- `furious push` - pushes the gem to Gemfury (requires `package` to have been run successfully, a `GEMFURY_TOKEN` environment variable to be set to your token, and a `GEMFURY_ACCOUNT` environment variable to be set to your account name)

Running `furious release` does all of the above, perfect for running in your CI environment for auto-releasing.

## Development

Run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/csutter/furious](https://github.com/csutter/furious).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
