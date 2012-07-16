module Lelylan
  class Client
    module Consumptions

      # Public: Returns extended information for a given consumption identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/devices/consumptions/#all Lelylan Dev Center}.
      #
      # options - The Hash option used to refine the search (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/consumptions/#all API doc} for the accepted options.
      # 
      # Returns Hashie List of consumptions.
      #
      # Examples
      # 
      #   # Retrurns the first 10 consumptions
      #   client.consumptions(per: 10)
      #
      #   # Returns the device consumptions from yesterday till now
      #   client.consumptions(from: 'yesterday')
      #
      def consumptions(options = {})
        get("/consumptions", options)
      end

      # Public: Returns extended information for a given consumption identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/devices/consumptions/#get Lelylan Dev Center}.
      #
      # consumption - A String that represent the consumption URI.
      #
      # Returns Hashie The consumption.
      #
      # Examples
      #
      #   consumption = "http://api.lelylan.com/consumption/4dcb9e23d033a9088902200a"
      #   client.consumption(consumption)
      #
      def consumption(consumption)
        get("/consumptions/#{find_id(consumption)}")
      end

      # Public: Create a consumption and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/devices/consumptions/#create Lelylan Dev Center}.
      #
      # options - The Hash option used to create the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/consumption/#create API doc} for the accepted options.
      # 
      # Returns Hashie The created consumption.
      #
      # Examples
      # 
      #   device = "http://api.lelylan.com/devices/4dcb9e23d033a9088900000a"
      #   client.create_conumption(device: device, value: 0.05, occur_at: "2025-08-17 07:50:16 +0200", duration: "1")
      #
      def create_consumption(options = {})
        post("/consumptions", options)
      end

      # Public: Update a consumption identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/devices/consumptions/#update Lelylan Dev Center}.
      #
      # consumption - A String that represent the consumption URI.
      # options - The Hash option used to update the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/consumptions/#update API doc} for the accepted options.
      # 
      # Returns Hashie The updated consumption.
      #
      # Examples
      # 
      #   consumption = "http://api.lelylan.com/consumptions/4dcb9e23d033a9088902200a"
      #   client.update_consumption(consumption, value: '0.04')
      #
      def update_consumption(consumption, options = {})
        put("/consumptions/#{find_id(consumption)}", options)
      end

      # Public: Delete a consumption identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/devices/consumptions/#delete Lelylan Dev Center}.
      #
      # consumption - A String that represent the consumption URI.
      # 
      # Returns Hashie The deleted consumption.
      #
      # Examples
      # 
      #   consumption = "http://api.lelyla.com/consumptions/4dcb9e23d033a9088902200a"
      #   client.delete_consumption(consumption)
      #
      def delete_consumption(consumption)
        delete("/consumptions/#{find_id(consumption)}")
      end
    end
  end
end
