# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "rouge-picat"
  s.version = "0.1.0"
  s.authors = ["Arclight Automata"]
  s.email = ["root@arclight.run"]
  s.summary = "A Picat language plugin for Rouge"
  s.description = <<-desc.strip.gsub(/\s+/, ' ')
    Support for the Picat programming language (picat-lang.org) for Rouge
  desc

  s.homepage = "https://github.com/arclight-automata/rouge-picat"
  s.files = Dir['Gemfile', 'LICENSE', 'README.md', 'rouge-picat.gemspec', 'lib/**/*.rb']
  s.licenses = ['MIT']
  s.required_ruby_version = '>= 3.0'

  s.add_dependency 'rouge', '>= 4.0', '< 6'
end
