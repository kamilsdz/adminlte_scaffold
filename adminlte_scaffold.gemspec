
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "adminlte_scaffold/version"

Gem::Specification.new do |spec|
  spec.name          = "adminlte_scaffold"
  spec.version       = AdminlteScaffold::VERSION
  spec.authors       = ["Kamil Sopata"]
  spec.email         = ["kamilsopata@gmail.com"]

  spec.summary       = "Generator AdminLTE scaffold"
  spec.description   = "Generator AdminLTE scaffold"
  spec.homepage      = "https://github.com/kamilsdz/adminlte_scaffold"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'draper'
  spec.add_dependency 'kaminari'
  spec.add_dependency 'font-awesome-rails'
  spec.add_dependency 'gettext'
  spec.add_dependency 'gettext_i18n_rails'
  spec.add_dependency 'haml-rails'
  spec.add_dependency 'bootstrap'
  spec.add_dependency 'ransack'
  spec.add_dependency 'ruby_parser'
end

