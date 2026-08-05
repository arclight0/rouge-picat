require_relative 'spec_helper'

class RougePicatTest < Minitest::Test
  # make sure guessing infrastructure works
  def test_extension_guess
    assert_equal Rouge::Lexer.guess(filename: 'foo.pi'), RougePicat::Picat
  end

  def test_mimetype_guess
    assert_equal Rouge::Lexer.guess(mimetype: 'text/x-picat'), RougePicat::Picat
  end

  # make sure the demo lexes with no errors and doesn't drop any characters
  def test_lexes_demo
    # [jneen] this should be RougePicat::Picat.demo, waiting for bugfix in:
    # https://github.com/rouge-ruby/rouge/pull/2218
    demo_text = RougePicat::Picat.instance_variable_get(:@demo)

    fulltext = []

    RougePicat::Picat.lex(demo_text) do |tok, text|
      fulltext << text
      refute_equal tok.qualname, 'Error'
    end

    assert_equal fulltext.join, demo_text
  end

  # make sure the stress-test lexes without throwing (maybe with error tokens)
  # and doesn't drop any characters
  def test_lexes_sample
    sample_text = File.read("#{__dir__}/sample.pi")

    fulltext = []

    RougePicat::Picat.lex(sample_text) do |tok, text|
      fulltext << text
    end

    assert_equal fulltext.join, sample_text
  end
end
