#LDL APP

require 'sinatra'
require 'sinatra/reloader'
require pry

require_relative #models path 
require_relative #models path

get '/' do
	erb :login_signup
end

get '/home' do 
	erb :home
end

















binding.pry