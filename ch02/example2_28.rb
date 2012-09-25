require 'sinatra'

before do
  content_type :txt
end

get '/' do
  request.methods.map { |m| m.to_s + "\n" }
end