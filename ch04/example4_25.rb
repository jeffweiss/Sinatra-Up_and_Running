require 'sinatra/base'
require 'rack/mount'

class Foo < Sinatra::Base
  get('/foo') { 'foo' }
end

class Bar < Sinatra::Base
  get('/bar') { 'bar' }
end

Routes = Rack::Mount::RouteSet.new do |set|
  set.add_route Foo, :path_info => %r{^/foo$}
  set.add_route Bar, :path_info => %r{^/bar$}
end

run Routes