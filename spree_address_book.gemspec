Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_address_book'
  s.version     = '1.4.0'
  s.summary     = 'Adds address book for users to Spree'
  #s.description = 'Add (optional) gem description here'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Roman Smirnov, Ramón Roche'
  s.email             = 'roman@railsdog.com, mrpollo@gmail.com'
  s.homepage          = 'http://github.com/romul/spree_address_book'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '~> 2.1')
  s.add_dependency('spree_auth_devise')

  s.add_development_dependency('rspec-rails',  '~> 2.7')
  s.add_development_dependency('sqlite3')
  s.add_development_dependency('capybara')
  s.add_development_dependency('factory_girl', '~> 2.6')
  s.add_development_dependency('database_cleaner')
  s.add_development_dependency('ffaker')
end
