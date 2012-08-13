require 'faraday'
require 'lelylan/version'

module Lelylan
  module Configuration
    VALID_OPTIONS_KEYS = [
      :adapter,
      :api_version,
      :api_endpoint,
      :web_endpoint,
      :endpoint,
      :user,
      :password,
      :proxy,
      :token,
      :user_agent,
      :auto_traversal,
      :per_page].freeze

    DEFAULT_ADAPTER        = Faraday.default_adapter
    DEFAULT_API_VERSION    = 0
    DEFAULT_API_ENDPOINT   = 'http://api.lelylan.com/'
    DEFAULT_WEB_ENDPOINT   = 'http://lelylan.com/'
    DEFAULT_USER_AGENT     = "Lelylan Ruby Gem #{Lelylan::Version}".freeze
    DEFAULT_AUTO_TRAVERSAL = false

    attr_accessor(*VALID_OPTIONS_KEYS)

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def api_endpoint=(value)
      @api_endpoint = File.join(value, "")
    end

    def web_endpoint=(value)
      @web_endpoint = File.join(value, "")
    end

    alias :endpoint= :api_endpoint=
    alias :endpoint :api_endpoint

    def reset
      self.adapter        = DEFAULT_ADAPTER
      self.api_version    = DEFAULT_API_VERSION
      self.api_endpoint   = DEFAULT_API_ENDPOINT
      self.web_endpoint   = DEFAULT_WEB_ENDPOINT
      self.user           = nil
      self.password       = nil
      self.proxy          = nil
      self.token          = nil
      self.user_agent     = DEFAULT_USER_AGENT
      self.auto_traversal = DEFAULT_AUTO_TRAVERSAL
    end
  end
end
