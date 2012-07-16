require 'lelylan/authentication'
require 'lelylan/connection'
require 'lelylan/request'

require 'lelylan/client/devices'
#require 'lelylan/client/consumptions'
#require 'lelylan/client/histories'
#require 'lelylan/client/types'
#require 'lelylan/client/properties'
#require 'lelylan/client/functions'
#require 'lelylan/client/statuses'
#require 'lelylan/client/categories'
#require 'lelylan/client/locations'

module Lelylan
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options={})
      options = Lelylan.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    def find_id(uri)
      Addressable::URI.parse(uri).basename
    end

    include Lelylan::Authentication
    include Lelylan::Connection
    include Lelylan::Request

    include Lelylan::Client::Devices
    #include Lelylan::Client::Consumptions
    #include Lelylan::Client::Histories
    #include Lelylan::Client::Types
    #include Lelylan::Client::Properties
    #include Lelylan::Client::Functions
    #include Lelylan::Client::Statuses
    #include Lelylan::Client::Categories
    #include Lelylan::Client::Locations
  end
end
