require 'sinatra'

before do
  content_type :txt
end

get '/' do
  request.env.map { |e| e.inspect + "\n" }
end