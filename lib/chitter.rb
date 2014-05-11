require 'sinatra/base'
require 'sinatra'
require 'data_mapper'
# require 'rack-flash'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'peep'

DataMapper.finalize
DataMapper.auto_upgrade!



class MyApp < Sinatra::Base
  get '/' do
    'Hello MyApp!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
