require 'sinatra/base'

class Foo < Sinatra::Base
  get('/foo') { 'foo' }
end

class Bar < Sinatra::Base
  get('/bar') { 'bar' }
end

run Rack::Cascade, [Foo, Bar]