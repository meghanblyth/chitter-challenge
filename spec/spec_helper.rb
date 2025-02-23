require 'simplecov'
require 'simplecov-console'
#require './setup_test_database' 

ENV['RACK_ENV'] = 'test'
#ENV['ENVIRONMENT'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.before(:each) do 
    setup_test_database
  end 
  
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end 

  # Bring in the contents of the `app.rb` file. The below is equivalent to: require_relative '../app.rb'
  require File.join(File.dirname(__FILE__), '..', 'app.rb')

  # Require all the testing gems
  require 'capybara'
  require 'capybara/rspec'
  require 'rspec'
  require 'webrick' 

  # Tell Capybara to talk to Chitter 
  Capybara.app = Chitter 
end 
