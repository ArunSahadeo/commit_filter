
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "commit_filter"

Gem::Specification.new do |spec|
  spec.name          = "commit_filter"
  spec.version       = 0.1
  spec.authors       = ["Arun Sahadeo"]
  spec.email         = ["arunjamessahadeo@gmail.com"]

  spec.summary       = %q{Creates a commit message hook for your Git repo that aborts the commit if the commit message contains any profanities.}
  spec.homepage      = "https://github.com/ArunSahadeo/commit_filter"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.7.0"
end
