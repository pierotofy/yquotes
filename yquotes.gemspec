# -*- encoding: utf-8 -*-
# stub: yquotes 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "yquotes".freeze
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["P Choudhary".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-06-02"
  s.email = ["pankaj17n@outlook.com".freeze]
  s.files = [".gitignore".freeze, ".rspec".freeze, ".travis.yml".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "bin/console".freeze, "bin/setup".freeze, "lib/yquotes.rb".freeze, "lib/yquotes/version.rb".freeze, "lib/yquotes/yahoo.rb".freeze, "yquotes.gemspec".freeze]
  s.homepage = "https://github.com/cpankaj/yquotes".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.10".freeze
  s.summary = "Get historical quotes from Yahoo Finance".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.14"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_runtime_dependency(%q<daru>.freeze, ["~> 0.1.5"])
      s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.7.2"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.14"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<daru>.freeze, ["~> 0.1.5"])
      s.add_dependency(%q<nokogiri>.freeze, ["~> 1.7.2"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.14"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<daru>.freeze, ["~> 0.1.5"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.7.2"])
  end
end
