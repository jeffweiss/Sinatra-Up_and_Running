require 'sinatra/base'

class ApplicationController < Sinatra::Base
  @subclasses = []
  def self.inherited(subclass)
    super
    # this will cause infinite recursion when the endpoint is actually hit
    # still tryin to work out why
    use subclass
  end

  enable :logging
end

class ExampleController < Sinatra::Base
  get('/example') { "Example!" }
end

# works with dynamically generated applications, too
Sinatra.new ApplicationController do
  get '/' do
    "See the <a href='/example'>example</a>."
  end
end

ApplicationController.run!