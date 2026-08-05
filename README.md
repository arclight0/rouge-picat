# rouge-picat

A [Rouge](https://github.com/rouge-ruby/rouge) plugin that adds syntax
highlighting support for the [Picat](http://picat-lang.org/) programming
language.

Picat is a logic-based multi-paradigm programming language aimed at
general-purpose applications, combining features from logic programming,
functional programming, and scripting languages.

## Background

This lexer was originally submitted to Rouge core as
[rouge-ruby/rouge#2110](https://github.com/rouge-ruby/rouge/pull/2110).
The Rouge maintainers declined the PR and asked that new languages be
distributed as plugin gems instead — this repository is that plugin.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rouge-picat'
```

Or install it directly:

```console
$ gem install rouge-picat
```

## Usage

Require the gem after Rouge and the lexer registers itself under the
`picat` tag:

```ruby
require 'rouge'
require 'rouge-picat'

source    = File.read('queens.pi')
formatter = Rouge::Formatters::HTML.new
lexer     = Rouge::Lexer.find('picat')

formatter.format(lexer.lex(source))
```

The lexer is also picked up automatically when guessing by filename
(`*.pi`) or mimetype (`text/x-picat`).

## Development

* `spec/sample.pi` holds the visual spec - this is text intended to
  stress-test the lexer and catch any weirdnesses or errors.
* `ruby preview.rb` will output the highlighted sample to the terminal.
  Set the environment variable `DEBUG=1` to instead output detailed debugging
  information.
* `rake` or `rake spec` runs the tests.
* `rake server` runs a preview server on port 9292, which hot-reloads the lexer.

This plugin follows the structure of the
[rouge-plugin-example](https://github.com/rouge-ruby/rouge-plugin-example)
repository. See also Rouge's [Lexer Development Guide][lexer-dev-doc].

[lexer-dev-doc]: https://rouge-ruby.github.io/docs/file.LexerDevelopment.html "Rouge's lexer development guide"

## License

MIT - see [LICENSE](LICENSE).
