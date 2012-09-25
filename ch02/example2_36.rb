require 'sinatra'

before do
  content_type :txt
end

get '/attachment' do
  attachment 'name_your_attachment.txt'
  "Here's what will be sent downstream, in  an attachment called 'name_your_attachment.txt'."
end