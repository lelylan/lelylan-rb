module Lelylan
  class Client
    module Types

      #
      # Public: Returns extended information for a given type identified from its ID.
      #
      # id - A String that represent the type ID.
      #
      # Returns Hashie The type.
      #
      def type(id)
        get("/types/#{id}")
      end

      #
      # Public: Returns a list of owned types.
      #
      # params - The Hash used to refine the search (default: {}).
      #
      # Returns Array List of types.
      #
      def types(params = {})
        get('/types', params)
      end

      #
      # Public: Returns a list of all existing types.
      #
      # params - The Hash used to refine the search (default: {}).
      #
      # Returns Array List of types.
      #
      def public_types(params = {})
        get('/types/public', params)
      end

      #
      # Public: Create a type and returns extended information for it.
      #
      # params - The Hash used to create the resource (default: {}).
      #
      # Returns Hashie The created type.
      #
      def create_type(params = {})
        post('/types', params)
      end

      #
      # Public: Update a type identified from its ID and returns extended information for it.
      #
      # id - A String that represent the type ID.
      # params - The Hash used to update the resource (default: {}).
      #
      # Returns Hashie The updated type.
      #
      def update_type(id, params = {})
        put("/types/#{id}", params)
      end

      #
      # Public: Delete a type identified from its ID and returns extended information for it.
      #
      # id - A String that represent the type ID.
      #
      # Returns Hashie The deleted type.
      #
      def delete_type(id)
        delete("/types/#{id}")
      end
    end
  end
end
