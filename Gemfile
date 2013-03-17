source 'https://rubygems.org'


gem 'rails', '3.2.11'
gem 'haml-rails'
gem 'kramdown'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rspec-rails', git: 'https://github.com/rspec/rspec-rails'
  gem "rspec",              git: "git://github.com/rspec/rspec.git"
  gem "rspec-core",         git: "git://github.com/rspec/rspec-core.git"
  gem "rspec-expectations", git: "git://github.com/rspec/rspec-expectations.git"
  gem "rspec-mocks",        git: "git://github.com/rspec/rspec-mocks.git"

  gem 'capybara'
  gem 'pry-rails'
  gem 'spork'
  # gem 'autotest-rails'
  # gem 'autotest'
  gem 'test_notifier'
  gem 'simplecov'
end

group :development do
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'pry-debugger'#, :require => false
  gem 'pry-exception_explorer'#, :require => false
  gem 'pry-remote'#, :require => false
  gem 'pry-stack_explorer'#, :require => false
end

group :test do
  gem 'cucumber-rails', git: 'https://github.com/cucumber/cucumber-rails.git', require: false
end

gem 'jquery-rails'
gem 'unicorn'
gem 'capistrano'
