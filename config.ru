require 'jimson'
require_relative 'my_handler'

use Rack::Reloader,0
use Rack::Runtime
run Jimson::Server.new(MyHandler.new)
