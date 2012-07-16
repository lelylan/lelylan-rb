module Lelylan
  # Internal: Custom error class for rescuing from all Lelylan errors
  class Error < StandardError; end

  # Internal: Raised when Lelylan returns a 400 HTTP status code
  class BadRequest < Error; end

  # Internal: Raised when Lelylan returns a 401 HTTP status code
  class Unauthorized < Error; end

  # Internal: Raised when Lelylan returns a 403 HTTP status code
  class Forbidden < Error; end

  # Internal: Raised when Lelylan returns a 404 HTTP status code
  class NotFound < Error; end

  # Internal: Raised when Lelylan returns a 406 HTTP status code
  class NotAcceptable < Error; end

  # Internal: Raised when Lelylan returns a 422 HTTP status code
  class UnprocessableEntity < Error; end

  # Internal: Raised when Lelylan returns a 500 HTTP status code
  class InternalServerError < Error; end

  # Internal: Raised when Lelylan returns a 501 HTTP status code
  class NotImplemented < Error; end

  # Internal: Raised when Lelylan returns a 502 HTTP status code
  class BadGateway < Error; end

  # Internal: Raised when Lelylan returns a 503 HTTP status code
  class ServiceUnavailable < Error; end
end
