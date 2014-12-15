#LDL APP
require 'pg'
require 'sinatra'
require 'sinatra/activerecord'

require_relative './models/group' 
require_relative './models/plan'
require_relative './model/user'

enable :sessions

helpers do 
	def current_user
		@current_user || nil
	end

	def current_user?
		@current_user == nil ? false : true
	end
end

before do 
	#something to do with session
	@current_user = User.find_by(:id => session[:user_id])
end

get '/' do
	erb :index
end

get '/users' do 
	if current_user?
		erb :profile
	else 
		redirect('/session/login')
	end
end

get '/session/login' do 
	erb :login
end

post '/session/login' do
	user = User.find_by(:email => params[:email])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect('/users')
	else
		"Invalid email or password. Try again."
		erb :login
	end
end

get '/session/sign_up' do 
	erb :sign_up
end

post '/session/sign_up' do 
	user = User.new(params)
	if user.save
		session[:user_id] = user.id
		redirect('/users')
	else
		@user = user_id
		erb :sign_up
	end
end

get '/session/logout' do 
	session.clear
	redirect('/')
end
