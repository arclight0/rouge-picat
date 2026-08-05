#!/usr/bin/env ruby

require 'rouge'
require_relative 'lib/rouge-picat'

fname = ARGV[0] || "#{__dir__}/spec/sample.pi"

if fname == 'demo'
  text = RougePicat::Picat.instance_variable_get(:@demo)
else
  text = File.read(fname)
end

Rouge::Lexer.enable_debug!

if ENV['DEBUG'] == '1'
  lexer = RougePicat::Picat.new(debug: true)
  formatter = 'null'
else
  lexer = RougePicat::Picat.new
  formatter = 'terminal_truecolor'
end

Rouge.highlight(text, lexer, formatter) { |chunk| print chunk }
