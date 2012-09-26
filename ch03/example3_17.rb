require 'sinatra'

get '/example' do
  'go to /inspect/example'
end

get '/inspect/*' do
  route = "/" + params[:splat].first
  data = call env.merge("PATH_INFO" => route)
  result = "Status: #{data[0]}\n"
  data[1].each do |header, value|
    result << "#{header}: #{value}\n"
  end
  result << "\n"
  data[2].each do |line|
    result << line
  end

  content_type :txt
  result
end