require 'base64'
require 'faraday_middleware'
require 'faraday/response/raise_http_error'

module Lelylan
  module Connection
    private

    def connection(method='get', path='', authenticate=true, raw=false, version=0, force_urlencoded=false)

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

      if path =~ /subscriptions/
        raise Lelylan::Error, 'To make a request to the realtime services you need both client id and client secret' if (!client_id or !client_secret) and path =~ /subscriptions/
      end

      if method == :delete
        options[:headers].merge!('Content-Length' => '0')
      end

      connection = Faraday.new(options) do |builder|
        builder.request :json
        builder.use Faraday::Request::BasicAuthentication, self.client_id, self.client_secret if path =~ /subscriptions/
        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseJson
        builder.use Faraday::Response::RaiseHttpError
        builder.adapter(adapter)
      end

      connection
    end
  end
end
