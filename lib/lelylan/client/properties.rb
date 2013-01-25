module Lelylan
  class Client
    module Properties

      #
      # Public: Returns extended information for a given property identified from its ID.
      #
      # id - A String that represent the property ID.
      #
      # Returns Hashie The property.
      #
      def property(id)
        get("/properties/#{id}")
      end

      #
      # Public: Returns a list of owned properties.
      #
      # params - The Hash used to refine the search (default: {}).
      #
      # Returns Array List of properties.
      #
      def properties(params = {})
        get('/properties', params)
      end

      #
      # Public: Returns a list of all existing properties.
      #
      # params - The Hash used to refine the search (default: {}).
      #
      # Returns Array List of types.
      #
      def public_properties(params = {})
        get('/properties/public', params)
      end

      #
      # Public: Create a property and returns extended information for it.
      #
      # params - The Hash used to create the resource (default: {}).
      #
      # Returns Hashie The created property.
      #
      def create_property(params = {})
        post('/properties', params)
      end

      #
      # Public: Update a property identified from its ID and returns extended information for it.
      #
      # id - A String that represent the property ID.
      # params - The Hash used to update the resource (default: {}).
      #
      # Returns Hashie The updated property.
      #
      def update_property(id, params = {})
        put("/properties/#{id}", params)
      end

      #
      # Public: Delete a property identified from its ID and returns extended information for it.
      #
      # id - A String that represent the property ID.
      #
      # Returns Hashie The deleted property.
      #
      def delete_property(id)
        delete("/properties/#{id}")
      end
    end
  end
end


