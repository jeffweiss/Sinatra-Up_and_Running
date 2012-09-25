require 'sinatra'

get '/:name' do
  # assumes a URL in the form /some_name?foo=XYZ
  "You asked for #{params[:name]} as well as #{params[:foo]}"
end