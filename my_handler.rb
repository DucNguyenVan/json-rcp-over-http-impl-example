require 'jimson'

class MyHandler
  extend Jimson::Handler 

  def sum(a,b)
    a + b
  end
end

