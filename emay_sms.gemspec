lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emay_sms/version'

Gem::Specification.new do |spec|
  spec.name          = "emay_sms"
  spec.version       = EmaySms::VERSION
  spec.authors       = ["liuzelei"]
  spec.email         = ["liuzelei@gmail.com"]
  spec.summary       = "亿美短信接口"
  spec.description   = "就是那个亿美啦"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "codeclimate-test-reporter"

  spec.add_dependency "savon", "~> 2.7.2"
end
