require 'sinatra'
require 'sinatra/activerecord'
require_relative './models/group' 
require_relative './models/plan'
require_relative './models/user'

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
  #session[:cart] ||= [] NEED TO ASSOCIATE THIS WITH USER PLANS
  @errors ||= []
  @current_user = User.find_by(:id => session[:user_id])
end

get '/' do
  erb :index
end

get '/session/users' do
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
    redirect('/session/users')
  else
    @errors << "Invalid email or password. Try again!"
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
    redirect('/session/users')
  else
    @user = user
    erb :sign_up
  end
end

get '/session/plans' do 
  erb :plans
end

get '/session/logout' do
  session.clear
  redirect('/')
end
