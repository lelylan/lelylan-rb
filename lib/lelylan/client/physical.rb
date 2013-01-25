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
        params[:nonce] = SecureRandom.uuid if not params[:nonce]

        digest    = OpenSSL::Digest::Digest.new('sha1')
        signature = OpenSSL::HMAC.hexdigest(digest, secret, params.to_json.to_s)
        headers   = { 'X-Physical-Signature' => signature, 'Content-Type' => 'application/json' }

        request  = Faraday.new
        response = request.put(uri, params, headers)
        response.body
      end
    end
  end
end
