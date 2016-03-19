$LOAD_PATH << './lib'
require 'jimson'
require 'rack/handler/unicorn'

class Foo
  extend Jimson::Handler 

  def sum(a,b)
    a + b
  end
end

class Bar
  extend Jimson::Handler 

  def concat(a,b)
    a + b
  end

end

# nested.baz.abs
class Baz
  extend Jimson::Handler 

  def abs(a)
    a.abs
  end
end

router = Jimson::Router.new
router.draw do 
  namespace 'foo', Foo
  namespace 'bar', Bar
  namespace 'ns' do
    namespace 'baz', Baz
  end
end
server = Jimson::Server.new(router, server: 'unicorn', show_errors: true)
server.start # serve with webrick on http://0.0.0.0:8999/
