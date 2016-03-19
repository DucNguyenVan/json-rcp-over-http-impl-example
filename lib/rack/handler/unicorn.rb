require 'unicorn'
require 'rack/handler'

class Rack::Handler::Unicorn
  def self.run app, opts
    server = ::Unicorn::HttpServer.new(
      app,
      :listeners => "#{opts[:Host]}:#{opts[:Port]}",
    )

    yield(server) if block_given?

    server.start.join
  end
end

Rack::Handler.register('unicorn', Rack::Handler::Unicorn)
