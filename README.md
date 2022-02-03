# Wordle

Ruby implementation of [Wordle](https://www.powerlanguage.co.uk/wordle/).

<img width="785" alt="Screen Shot 2022-01-14 at 8 10 22 PM" src="https://user-images.githubusercontent.com/22665228/149608330-f5514be8-c0d9-4860-9ed4-d652fdb35cb3.png">

[![Build](https://github.com/JonathanWThom/wordle/actions/workflows/build.yml/badge.svg)](https://github.com/JonathanWThom/wordle/actions/workflows/build.yml)

## Installation

`gem install wordle`

## Usage

Just run `wordle` from the command line.

After the game, a hash will be included with your result. A friend can pass this
hash as the `-i` option to play the same word as you, e.g. `wordle -i ed541a`.

This version will pull a new word at random every time you run it from a very weird and long list. It's much more difficult than the original due to some of the words being a bit uncommon.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JonathanWThom/wordle. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/JonathanWThom/wordle/blob/main/CODE_OF_CONDUCT.md).

## Acknowledgements

I cribbed my word list from the Wordle site itself. I have no association with the site or its creator, I'm just a fan!

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Wordle project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/JonathanWThom/wordle/blob/main/CODE_OF_CONDUCT.md).
