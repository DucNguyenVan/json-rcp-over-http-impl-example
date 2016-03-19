$LOAD_PATH << './lib'
require 'jimson'
require 'rack/handler/unicorn'

class MyHandler
  extend Jimson::Handler 

  def sum(a,b)
    a + b
  end
end


# Build app
app = Rack::Builder.new  do
  use Rack::Reloader,10
  use Rack::Runtime
  run Jimson::Server.new(MyHandler.new, server: 'unicorn')
end

# Start server
opts = {server: 'unicorn'}
Rack::Server.start(opts.merge(
  app: app,
  Host: '0.0.0.0',
  Port: '8999',
))
