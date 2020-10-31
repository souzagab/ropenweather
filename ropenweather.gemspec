# frozen_string_literal: true

require_relative 'lib/ropenweather/version'

Gem::Specification.new do |spec|
  spec.name = 'ropenweather'
  spec.version = Ropenweather::VERSION
  spec.description = 'A Ruby Wrapper to the OpenWeatherMap API'
  spec.authors = 'Gabriel S.'
  spec.email = 'desouza.gabriel@icloud.com'
  spec.summary = spec.description
  spec.homepage = 'https://github.com/souzagab/ropenweather.'
  spec.license = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')
  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/souzagab/ropenweather.'

  spec.add_dependency('rest-client', '>=2.0.0')

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    %x(git ls-files -z).split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
end
