require 'sinatra/base'
require 'sinatra'
require 'data_mapper'
require 'launchy'
require 'rack-flash'


env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative './lib/peep'
require_relative './lib/user'


DataMapper.finalize
DataMapper.auto_upgrade!



class MyApp < Sinatra::Base
  
enable :sessions
set :session_secret, 'super-secret'

use Rack::Flash

	post '/users/new' do
		@user = User.create(:name => params[:user], :user_name => params[:user_name], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
		if @user.save
			session[:user_id] = @user.id
			redirect to('/')
		else
			flash.now[:errors] = @user.errors.full_messages
			# flash[:notice] = 'Sorry, your passwords do not match'
			erb :register
		end
	end

  get '/' do
		@peeps=Peep.all
    erb :index
  end

  get '/users/new' do 
		erb :register
	end


	helpers do 

		def current_user
			@current_user ||= User.get(session[:user_id]) if session[:user_id]
		end

	end



end
