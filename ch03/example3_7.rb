require 'sinatra'
require './sinatra/post_get'

post_get '/' do
  "Hi #{params[:name]}"
end