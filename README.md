# Itamae::Plugin::Resource::AurPackage

An Itamae resource for AUR (Arch User Repository)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-resource-aur_package'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install itamae-plugin-resource-aur_package

## Usage

```ruby
aur_package 'rbenv'
```

Note: It uses `yay` if it is available. If not, it uses `makepkg`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pocke/itamae-plugin-resource-aur_package.
