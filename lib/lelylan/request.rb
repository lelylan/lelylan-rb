require 'multi_json'

module Lelylan
  module Request

    # Internal: Perform an HTTP DELETE request.
    def delete(path, options={}, authenticate=true, raw=false, version=api_version, force_urlencoded=false)
      request(:delete, path, options, authenticate, raw, version, force_urlencoded)
    end

    # Internal: Perform an HTTP GET request.
    def get(path, options={}, authenticate=true, raw=false, version=api_version, force_urlencoded=false)
      request(:get, path, options, authenticate, raw, version, force_urlencoded)
    end

    # Internal: Perform an HTTP PATCH request.
    def patch(path, options={}, authenticate=true, raw=false, version=api_version, force_urlencoded=false)
      request(:patch, path, options, authenticate, raw, version, force_urlencoded)
    end

    # Internal: Perform an HTTP POST request.
    def post(path, options={}, authenticate=true, raw=false, version=api_version, force_urlencoded=false)
      request(:post, path, options, authenticate, raw, version, force_urlencoded)
    end

    # Internal: Perform an HTTP PUT request.
    def put(path, options={}, authenticate=true, raw=false, version=api_version, force_urlencoded=false)
      request(:put, path, options, authenticate, raw, version, force_urlencoded)
    end

    private

    # Internal: Perform the HTTP request.
    #
    # method - The Symbol representing the HTTP method.
    # path - The String URI to call.
    # options - The Hash options containing the params to send to the
    #           service.
    # authenticate - The Boolean value that authenticate the user.
    # raw - The Boolean value let return the complete response.
    # force_urlencoded - The Boolean value that force the url encoding.
    def request(method, path, options, authenticate, raw, version, force_urlencoded)
      response = connection(authenticate, raw, version, force_urlencoded, path).send(method) do |request|
        case method
        when :delete, :get
          request.url(path, options)
        when :patch, :post, :put
          request.url(path)
          request.body = options unless options.empty?
        end
      end

      raw ? response : response.body
    end
  end
end
