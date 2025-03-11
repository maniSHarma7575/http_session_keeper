class Request
  attr_reader :method, :path, :headers, :body

  def initialize(client)
    @client = client
    parse_request
  end

  private

  def parse_request
    request_line = @client.gets
    @method, @path, _ = request_line.split
    @headers = parse_headers
    @body = parse_body
  end

  def parse_headers
    headers = {}

    while (line = @client.gets) != "\r\n"
      key, value = line.split(": ")
      headers[key] = value.strip
    end

    headers
  end

  def parse_body
    return unless @headers["Content-Length"]

    @client.read(@headers["Content-Length"].to_i)
  end
end
