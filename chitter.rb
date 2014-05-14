require 'sinatra/base'
require 'sinatra'
require 'data_mapper'
require 'launchy'
require 'rack-flash'

require_relative './lib/peep'
require_relative './lib/user'

require_relative './data_mapper_setup'

class MyApp < Sinatra::Base
  
enable :sessions
set :session_secret, 'super-secret'

use Rack::Flash

	post '/users' do
		@user = User.create(:name => params[:name], :user_name => params[:user_name], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
		if @user.save
			session[:user_id] = @user.id
			redirect to('/')
		else
			flash.now[:errors] = @user.errors.full_messages
			# flash[:notice] = 'Sorry, your passwords do not match'
			erb :register
		end
	end

	post '/sessions' do 
		email,password = params[:email], params[:password]
		@user = User.authenticate(email, password)
			if @user
				session[:user_id] = @user.id 
				redirect to('/')
			else
				flash[:errors] = ["The email or password is incorrect"]
				erb :index
			end
	end

  get '/' do
  	# @session=session[:user_id]
		@peeps=Peep.all
    erb :index
  end

  get '/users/new' do 
		erb :register
	end


	helpers do 

		def current_user
			@current_user ||= User.get(session[:user_id]) if session[:user_id]
			# @current_user = 1
		end

	end



end
