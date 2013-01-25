require 'faraday_middleware'
require 'faraday/response/raise_http_error'

module Lelylan
  module Connection
    private

    def connection(authenticate=true, raw=false, version=0, force_urlencoded=false, path='')

      options = {
        :headers => {'Accept' => 'application/json', 'User-Agent' => user_agent, 'Content-Type' => 'application/json'},
        :proxy => proxy,
        :ssl => { :verify => false },
        :url => Lelylan.api_endpoint
      }

      if authenticated?
        self.token = token.refresh! if token.expired?
        options[:headers].merge!('Authorization' => "Bearer #{token.token}")
      end

      connection = Faraday.new(options) do |builder|
        builder.request :json
        builder.use Faraday::Response::RaiseHttpError
        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseJson
        builder.adapter(adapter)
      end

      connection.basic_auth(self.client_id, self.client_secret) if path =~ /subscriptions/

      connection
    end
  end
end
