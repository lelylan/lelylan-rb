require 'lelylan/authentication'
require 'lelylan/connection'
require 'lelylan/request'

require 'lelylan/client/profile'
require 'lelylan/client/device'
require 'lelylan/client/history'
require 'lelylan/client/type'
require 'lelylan/client/property'
require 'lelylan/client/function'
require 'lelylan/client/status'
require 'lelylan/client/location'
require 'lelylan/client/subscription'

module Lelylan
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options={})
      options = Lelylan.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    # structure related
    include Lelylan::Authentication
    include Lelylan::Connection
    include Lelylan::Request

    # client related
    include Lelylan::Client::Profile
    include Lelylan::Client::Device
    include Lelylan::Client::History
    include Lelylan::Client::Type
    include Lelylan::Client::Property
    include Lelylan::Client::Function
    include Lelylan::Client::Status
    include Lelylan::Client::Location
    include Lelylan::Client::Subscription
  end
end
