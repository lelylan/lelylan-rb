require 'faraday'
require 'hashie'

module Faraday
  class Response::RaiseHttpError < Response::Middleware
    def on_complete(response)
      case response[:status].to_i
      when 400
        raise Lelylan::BadRequest, error_message(response)
      when 401
        raise Lelylan::Unauthorized, error_message(response)
      when 403
        raise Lelylan::Forbidden, error_message(response)
      when 404
        raise Lelylan::NotFound, error_message(response)
      when 406
        raise Lelylan::NotAcceptable, error_message(response)
      when 422
        raise Lelylan::UnprocessableEntity, error_message(response)
      when 500
        raise Lelylan::InternalServerError, error_message(response)
      when 501
        raise Lelylan::NotImplemented, error_message(response)
      when 502
        raise Lelylan::BadGateway, error_message(response)
      when 503
        raise Lelylan::ServiceUnavailable, error_message(response)
      end
    end

    def error_message(response)
      body = response[:body] || ''

      begin
        body = Hashie::Mash.new(JSON.parse(response[:body]))
      rescue
      end

      body.is_a?(::Hashie::Mash) ? body.error.description : body
    end
  end
end
