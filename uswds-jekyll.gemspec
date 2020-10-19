# coding: utf-8

Gem::Specification.new do |s|
  s.name          = 'uswds-jekyll'
  s.version       = '5.2.0'
  s.authors       = ['Shawn Allen', 'Tom Black', 'Brian Hurst', 'Scott Weber', 'Dan O. Williams']
  s.email         = ['daniel.williams@gsa.gov']

  s.summary       = "A Jekyll theme for the U.S. Web Design System."
  s.homepage      = "https://designsystem.digital.gov/"
  s.license       = "CC0-1.0"

  s.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  s.add_runtime_dependency "jekyll", ">= 4.0", "< 5"
  s.add_runtime_dependency "jekyll-autoprefixer"
  # while not strictly required — another runtime from https://github.com/rails/execjs#readme could be used for autoprefixer — simpler to require this by default
  s.add_runtime_dependency "mini_racer"

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
end
