$LOAD_PATH << './lib'
require 'jimson'
require 'rack/handler/unicorn'

class MyHandler
  extend Jimson::Handler 

  def sum(a,b)
    a + b
  end
end

server = Jimson::Server.new(MyHandler.new, server: 'unicorn')
server.start # serve with webrick on http://0.0.0.0:8999/
