# coding: utf-8
lib = File.expand_path('.../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
    spec.name           = "NAME"
    spec.version        = "1.0"
    spec.authors        = ["Liana Severo"]
    spec.email          = ["lianasevero3@gmail.com"]
    spec.summary        = %q{Simple text-based game}
    spec.description    = %q{Longer description goes here}
    spec.homepage       = "http://domainforproject.com/"
    spec.license        = "MIT"

    spec.files          = ['lib/dragonheart.rb']
    spec.executables    = ['bin/dragonheart']
    spec.test_files     = ['tests/test_dragonheart.rb']
    spec.require_paths  = ["lib"]
end
