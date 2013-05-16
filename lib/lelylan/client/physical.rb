require 'uri'
require 'openssl'
require 'securerandom'
require 'json'
require 'lelylan/authentication'

module Lelylan
  class Client
    module Physical

      #
      # Public: Send a request adding a nonce and a X-Physical-Signature
      # header.
      #
      # uri - A String that represents the uri of the physical device.
      # secret - The device secret.
      # params - An object containing the JSON params to send.
      #
      # Returns Hashie The JSON resource.
      #
      def physical_properties(uri, secret, params)
        headers = { 'X-Physical-Secret' => secret }

        request  = Faraday.new do |builder|
          builder.request :json
          builder.use Faraday::Response::RaiseHttpError
          builder.use FaradayMiddleware::Mashify
          builder.use FaradayMiddleware::ParseJson
          builder.adapter(adapter)
        end

        response = request.put(uri, params, headers)
        response.body
      end
    end
  end
end
