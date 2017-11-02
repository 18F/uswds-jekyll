# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "uswds-jekyll"
  spec.version       = "1.4.1"
  spec.authors       = ["Shawn Allen"]
  spec.email         = ["shawn.allen@gsa.gov"]

  spec.summary       = %q{A Jekyll theme for the U.S. Web Design Standards}
  spec.homepage      = "https://standards.usa.gov/"
  spec.license       = "CC0-1.0"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.4"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
