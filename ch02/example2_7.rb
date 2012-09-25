require 'sinatra'

get '/*' do
  "NOM NOM NOM"
end

get '/specific' do
  "You'll never, ever see me."
end