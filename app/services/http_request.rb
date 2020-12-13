class HttpRequest
  def initialize(base_url)
    @connection ||= Faraday.new(base_url, headers: {'Content-Type' => 'application/json'})
  end

  def get(url, params)
    response = @connection.get(url) do |req|
      req.params = params
    end

    return JSON.parse(response.env.response_body)['list'] if response.status == 200
    
    nil
  end
end
