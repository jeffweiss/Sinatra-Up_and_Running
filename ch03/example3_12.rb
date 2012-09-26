module MySinatra
  class Application
    def self.call(env)
      new.call(env)
    end

    def call(env)
      headers = {'Content-Type' => 'text/html'}
      if env['PATH_INFO'] == '/'
        status, body = 200, 'hi'
      else
        status, body = 404, "Sinatra doesn't know this ditty!"
      end
      headers['Content-Length'] = body.length.to_s
      [status, headers, [body]]
    end
  end
end

require 'thin'
Thin::Server.start MySinatra::Application, 4567