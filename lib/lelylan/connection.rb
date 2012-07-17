require 'faraday_middleware'
require 'faraday/response/raise_http_error'

module Lelylan
  module Connection
    private

    def connection(authenticate=true, raw=false, version=0, force_urlencoded=false)

      options = {
        :headers => {'Accept' => 'application/json', 'User-Agent' => user_agent, 'Content-Type' => 'application/json'},
        :proxy => proxy,
        :ssl => { :verify => false },
        :url => Lelylan.api_endpoint,
      }

      options.merge!(:params => {:access_token => oauth_token}) if oauthed? && !authenticated?

      connection = Faraday.new(options) do |builder|
        builder.request :json
        builder.use Faraday::Response::RaiseHttpError
        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseJson
        builder.adapter(adapter)
      end

      connection.basic_auth authentication[:user], authentication[:password] if authenticate and authenticated?
      connection
    end
  end
end
