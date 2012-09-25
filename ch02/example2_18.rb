require 'sinatra'

get '/home' do
  @name = 'Random User'
  erb :home
end