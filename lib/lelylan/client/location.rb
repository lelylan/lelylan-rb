module Lelylan
  class Client
    module Location

      #
      # Public: Returns extended information for a given location identified from its ID.
      #
      # id - A String that represent the location ID.
      #
      # Returns Hashie The location.
      #
      def location(id)
        get("/locations/#{id}")
      end

      #
      # Public: Returns a list of owned locations.
      #
      # params - The Hash used to refine the search (default: {}).
      #
      # Returns Array List of locations.
      #
      def locations(params = {})
        get('/locations', params)
      end

      #
      # Public: Create a location and returns extended information for it.
      #
      # params - The Hash used to create the resource (default: {}).
      #
      # Returns Hashie The created location.
      #
      def create_location(params = {})
        post('/locations', params)
      end

      #
      # Public: Update a location identified from its ID and returns extended information for it.
      #
      # id - A String that represent the location ID.
      # params - The Hash used to update the resource (default: {}).
      #
      # Returns Hashie The updated location.
      #
      def update_location(id, params = {})
        put("/locations/#{id}", params)
      end

      #
      # Public: Delete a location identified from its ID and returns extended information for it.
      #
      # id - A String that represent the location ID.
      #
      # Returns Hashie The deleted location.
      #
      def delete_location(id)
        delete("/locations/#{id}")
      end
    end
  end
end
