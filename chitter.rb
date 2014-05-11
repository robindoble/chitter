require 'sinatra/base'
require 'sinatra'
require 'data_mapper'
# require 'rack-flash'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative './lib/peep'
require_relative './lib/user'


DataMapper.finalize
DataMapper.auto_upgrade!



class MyApp < Sinatra::Base
  
  get '/' do
		@peeps=Peep.all
		# end
  	# puts @peeps.inspect
    erb :index
  end

  # start the server if ruby file executed directly
  # run! if app_file == $0
end
