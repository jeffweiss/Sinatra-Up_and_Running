require 'sinatra'

get '/*' do
  "You passed in #{params[:splat]}"
end