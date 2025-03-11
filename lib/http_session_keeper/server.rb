# frozen_string_literal: true
module HttpSessionKeeper
  class Server
    def initialize(port: 3000, redis_url: "redis://localhost:6379")
      @port = port
      @redis_helper = RedisHelper.new(redis_url)
    end

    def start
      server = TCPServer.new('localhost', @port)
      puts "Server started at http://localhost:#{@port}"

      loop do
        client = server.accept
        request = Request.new(client)
        response = Response.new

        response.headers["Content-Type"] = "text/html"
        response.headers["X-Custom-Header"] = "Hello from HttpSessionKeeper"
        controller = Controllers::HomeController.new(request, response, @redis_helper)
        controller.index

        client.puts response.to_s
        client.close
      end
    end
  end
end

