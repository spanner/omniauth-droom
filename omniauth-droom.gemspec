# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/droom/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-droom'
  s.version  = OmniAuth::Droom::VERSION
  s.authors  = ['William ROss']
  s.email    = ['will@spanner.org']
  s.summary  = 'Droom strategy for OmniAuth'
  s.description  = 'Makes it easy for another application to use the oauth provider built into the data room.'
  s.homepage = 'https://github.com/spanner/omniauth-droom'
  s.license  = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'rake'
end
