module Lelylan
  class Client
    module Histories

      # Public: Returns extended information for a given history identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/devices/history/#get Lelylan Dev Center}.
      #
      # history - A String that represents the history URI.
      #
      # Returns Hashie The history resource.
      #
      # Examples
      #
      #   history = "http://api.lelylan.com/histories/4dcb9e23d033a9088900200f"
      #   client.history(history)
      #
      def history(history)
        get("/histories/#{find_id(history)}")
      end

      # Public: Returns a list of history resources for a given device identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/devices/history/#all Lelylan Dev Center}.
      #
      # device - A String that represents the device URI.
      # options - The Hash option used to refine the search (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/history/#all API doc} for the accepted options.
      # 
      # Returns Hashie List of histories.
      #
      # Examples
      # 
      #   # Returns the first 10 histories for a specific device)
      #   device = "http://api.lelyla.com/devices/4dcb9e23d033a9088900023b"
      #   client.histories(device, per: 10)
      #
      #
      def histories(device, options = {})
        get("/devices/#{find_id(device)}/histories", options)
      end
    end
  end
end
