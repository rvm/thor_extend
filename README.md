# ThorExtend

ThorExtend adds options to already defined Thor commands.
Normally, you define options like this:

```ruby
require 'thor'
class MyCLI < Thor
  option :arg1
  option :arg2
  def action
    #...
  end
end
```

This is only works if you know the options upfront but not if you need to define them at runtime dynamically.
With ThorExtend you can add those when the cli class is already loaded:

```ruby
extender = ThorExtend.new(MyCLI)
extender.command("action").add(:arg3, {})
```

Here you add `arg3` to the `action` command.
The hash which is passed to `add` contains options you would normally pass additionally, e.g. a `type`.
Example:

```ruby
option :yesno, :type => :boolean
def action
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ThorExtend'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ThorExtend

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ThorExtend/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
