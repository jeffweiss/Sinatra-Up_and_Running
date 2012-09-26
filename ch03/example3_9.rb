require 'sinatra'
require './sinatra/link_helper'

get '/' do
  erb :linkhelper
end