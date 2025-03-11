class Cookie
  attr_reader :cookies
  def initialize(request_headers)
    @cookies = parsed_cookies(request_headers)
  end

  def [](key)
    @cookies[key]
  end

  def []=(key, value)
    @cookies[key] = value
  end

  private

  def parsed_cookies(request_headers)
    cookies = {}

    request_headers["Cookie"]&.split(";")&.each do |cookie|
      key, value = cookie.split("=")
      cookies[key.strip] = value
    end
    cookies
  end
end