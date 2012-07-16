require 'lelylan/configuration'
require 'lelylan/client'
require 'lelylan/error'

module Lelylan
  extend Configuration

  class << self

    # Alias for Lelylan::Client.new
    def new(options={})
      Lelylan::Client.new(options)
    end

    # Delegate to Lelylan::Client.new
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
