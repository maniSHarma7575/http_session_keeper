module HttpSessionKeeper
  module Controllers
    class HomeController < Controller
      def index
        session[:counter] ||= 0
        session[:counter] += 1
        render "Hello, World! Counter: #{session[:counter]}"
      end
    end
  end
end
