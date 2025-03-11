class Response
  attr_accessor :status, :headers, :body

  def initialize
    @status = "200 OK"
    @headers = {}
    @body = ""
  end

  def to_s
    formatted_headers = @headers.map do |key, value|
      if key == "Set-Cookie" && value.is_a?(Array)
        value.map { |v| "#{key}: #{v}" }.join("\r\n")
      else
        "#{key}: #{value}"
      end
    end.join("\r\n")
  
    "HTTP/1.1 #{@status}\r\n" +
      formatted_headers +
      "\r\n\r\n" +
      @body + "\r\n"
  end

  def set_cookie(cookie, options = {})
    cookies = cookie.cookies
    return if cookies.empty?

    @headers["Set-Cookie"] ||= []

    cookies.each do |key, value|
      cookie = "#{key}=#{value}"
      cookie << "; Path=#{options[:path]}" if options[:path]
      cookie << "; HttpOnly" if options[:httponly]
      cookie << "; Secure" if options[:secure]
      cookie << "; SameSite=#{options[:samesite]}" if options[:samesite]

      @headers["Set-Cookie"] << cookie
    end
  end
end
