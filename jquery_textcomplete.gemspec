# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jquery_textcomplete/version'

Gem::Specification.new do |spec|
  # maybe refactor, change name to jquery_textcomplete-rails
  spec.name          = "jquery_textcomplete"
  spec.version       = JqueryTextcomplete::VERSION
  spec.authors       = ["Sebastian Peterlin"]
  spec.email         = ["speterlin@gmail.com"]

  spec.summary       = %q{JqueryTextcomplete is a Ruby on Rails gem enabling text autocomplete in search fields, textareas, and other textfield inputs!}
  spec.description   = %q{JqueryTextcomplete is a Ruby on Rails gem enabling text autocomplete in search fields, textareas, and other textfield inputs! Can be used in conjunction with searchkick gem for suggesting autocomplete results and with acts-as-taggable-on gem for autocomplete tagging. Requires Jquery.}
  spec.homepage      = "http://github.com/speterlin/jquery_textcomplete"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "rails", "~> 5.0"
  # to be able to use sass, not sure if I need sass gem, maybe replace rails with railties
  spec.add_dependency "sass", "~> 3.0"
  spec.add_dependency "sass-rails", "~> 5.0"
  # maybe add spec.add_dependency 'jquery-rails' and spec.add_dependency 'jquery-ui-rails'

end
