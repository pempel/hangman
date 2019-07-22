# hangman

A simple Ruby implementation of the hangman game.

Hi, guys! I'd like to share with you a bit more complex solution for your technical task (the hangman game). It's unlikely that a such solution can be written during an interview, but you can consider it as a "bonus track".

All the game logic (`Engine`) doesn't depend on the interface implementation (`Interface::Default`), so we can easily implement any other interfaces. For that we need to derive a new class from the `Interface::Base` class and override all abstract methods.

## Usage

After checking out the repo, run `exe/hangman`. For more information, run `exe/hangman -h`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bin/rake install`. To release a new version, update the version number in `version.rb`, and then run `bin/rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
