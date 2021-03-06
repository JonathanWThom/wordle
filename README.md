# Wordle

Ruby implementation of [Wordle](https://www.powerlanguage.co.uk/wordle/).

<img width="869" alt="Screen Shot 2022-02-02 at 10 32 02 PM" src="https://user-images.githubusercontent.com/22665228/152292863-33743039-d9f4-4afa-a321-684d7b67cdb3.png">

[![Build](https://github.com/JonathanWThom/wordle/actions/workflows/build.yml/badge.svg)](https://github.com/JonathanWThom/wordle/actions/workflows/build.yml)

## Installation

`gem install wordle`

## Usage

Just run `wordle` from the command line.

This version will pull a new word at random every time you run it from a very weird and long list. It's much more difficult than the original due to some of the words being a bit uncommon.

```
Usage: wordle [options]
    -i, --identifier=IDENTIFIER      Pass word identifer to target a specific word that someone else has played. Identifier gets printed at the end of the game to share with a friend.
    -d, --difficult                  Hard mode. Any revealed hints must be used in subsequent guesses.
    -c, --contrast                   High contrast mode. Matched letters will be orange. Included letters will be blue.
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JonathanWThom/wordle. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/JonathanWThom/wordle/blob/main/CODE_OF_CONDUCT.md).

## Acknowledgements

I cribbed my word list from the Wordle site itself. I have no association with the site, its creator, or the New York Times - I'm just a fan!

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Wordle project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/JonathanWThom/wordle/blob/main/CODE_OF_CONDUCT.md).
