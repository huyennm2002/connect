# -*- encoding: utf-8 -*-
# stub: snaky_hash 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "snaky_hash".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://gitlab.com/oauth-xx/snaky_hash/-/issues", "changelog_uri" => "https://gitlab.com/oauth-xx/snaky_hash/-/blob/v2.0.0/CHANGELOG.md", "documentation_uri" => "https://www.rubydoc.info/gems/snaky_hash/2.0.0", "homepage_uri" => "https://gitlab.com/oauth-xx/snaky_hash", "rubygems_mfa_required" => "true", "source_code_uri" => "https://gitlab.com/oauth-xx/snaky_hash/-/tree/v2.0.0", "wiki_uri" => "https://gitlab.com/oauth-xx/snaky_hash/-/wikis/home" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Peter Boling".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-08-29"
  s.description = "A Hashie::Mash joint to make #snakelife better".freeze
  s.email = ["peter.boling@gmail.com".freeze]
  s.homepage = "https://gitlab.com/oauth-xx/snaky_hash".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2".freeze)
  s.rubygems_version = "3.2.32".freeze
  s.summary = "A very snaky hash".freeze

  s.installed_by_version = "3.2.32" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<hashie>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<version_gem>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<rake>.freeze, [">= 12"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 3"])
    s.add_development_dependency(%q<rubocop-lts>.freeze, ["~> 8.0"])
    s.add_development_dependency(%q<rspec-block_is_expected>.freeze, [">= 0"])
  else
    s.add_dependency(%q<hashie>.freeze, [">= 0"])
    s.add_dependency(%q<version_gem>.freeze, ["~> 1.1"])
    s.add_dependency(%q<rake>.freeze, [">= 12"])
    s.add_dependency(%q<rspec>.freeze, [">= 3"])
    s.add_dependency(%q<rubocop-lts>.freeze, ["~> 8.0"])
    s.add_dependency(%q<rspec-block_is_expected>.freeze, [">= 0"])
  end
end
