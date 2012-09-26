require 'sinatra/base'
require 'time'

class GithubHook < Sinatra::Base
  post '/update' do
    app.settings.reset!
    load app.settings.app_file

    content_type :txt
    "ok"
  end
end