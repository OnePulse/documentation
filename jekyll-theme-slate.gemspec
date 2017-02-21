# encoding: utf-8

Gem::Specification.new do |s|
  s.name          = "OnePulse Documentation"
  s.version       = "1.0.0"
  s.license       = "CC0-1.0"
  s.authors       = ["OnePulse"]
  s.email         = ["barry.whyte@onepulse.com"]
  s.homepage      = "https://github.com/OnePulse/documentation"
  s.summary       = "Documentation Repository"

  s.files         = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r{^((_includes|_layouts|_sass|assets)/|(LICENSE|README)((\.(txt|md|markdown)|$)))}i)
  end

  s.platform      = Gem::Platform::RUBY
  s.add_runtime_dependency "jekyll", "~> 3.3"
end
