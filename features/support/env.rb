# Generated by cucumber-sinatra. (2014-05-11 18:18:57 +0100)

ENV["RACK_ENV"] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', './chitter.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = MyApp

class MyAppWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  MyAppWorld.new
end


# require 'database_cleaner'

# DatabaseCleaner.strategy = :truncation

# 	Before do 
#   	DatabaseCleaner.start
#   end

#   After do 
#   	DatabaseCleaner.clean
#   end



  