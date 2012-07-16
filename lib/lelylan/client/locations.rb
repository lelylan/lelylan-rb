module Lelylan
  class Client
    module Locations

      # Public: Returns extended information for a given location identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/locations/#get Lelylan Dev Center}.
      #
      # location - A String that represent the location URI.
      #
      # Returns Hashie The location.
      #
      # Examples
      #
      #   location = "http://api.lelylan.com/location/4dcb9e23d033a9088902200a"
      #   client.location(location)
      #
      def location(location)
        get("/locations/#{find_id(location)}")
      end

      # Public: Returns extended information for a given location identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/locations/#all Lelylan Dev Center}.
      #
      # options - The Hash option used to refine the search (default: {}).
      #           Check out the {http://dev.lelylan.com/rest/locations/#all API doc} for the accepted options.
      # 
      # Returns Hashie List of locations.
      #
      # Examples
      # 
      #   # Retrurns the first 10 locations
      #   client.locations(per: 10)
      #
      #   # Returns the device locations from yesterday till now
      #   client.locations(type: 'room')
      #
      def locations(options = {})
        get("/locations", options)
      end

      # Public: Create a location and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/locations/#create Lelylan Dev Center}.
      #
      # options - The Hash option used to create the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/location/#create API doc} for the accepted options.
      # 
      # Returns Hashie The created location.
      #
      # Examples
      # 
      #   client.create_location(name: 'Kids bedroom', type: 'room')
      #
      def create_location(options = {})
        post("/locations", options)
      end

      # Public: Update a location identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/locations/#update Lelylan Dev Center}.
      #
      # location - A String that represent the location URI.
      # options - The Hash option used to update the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/locations/#update API doc} for the accepted options.
      # 
      # Returns Hashie The updated location.
      #
      # Examples
      # 
      #   location = "http://api.lelylan.com/locations/4dcb9e23d033a9088902200a"
      #   client.update_location(location, name: 'Big mama bedroom')
      #
      def update_location(location, options = {})
        put("/locations/#{find_id(location)}", options)
      end

      # Public: Delete a location identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/locations/#delete Lelylan Dev Center}.
      #
      # location - A String that represent the location URI.
      # 
      # Returns Hashie The deleted location.
      #
      # Examples
      # 
      #   location = "http://api.lelyla.com/locations/4dcb9e23d033a9088902200a"
      #   client.delete_location(location)
      #
      def delete_location(location)
        delete("/locations/#{find_id(location)}")
      end
    end
  end
end
