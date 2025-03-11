class Controller
  attr_reader :request, :response, :session, :cookie

  def initialize(request, response, session_store)
    @request = request
    @response = response
    @cookie = Cookie.new(request.headers)
    @session = Session.new(@cookie, session_store)
  end

  def render(text)
    @response.set_cookie(@session.save)
    @response.body = text
  end
end
