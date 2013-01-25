module Lelylan
  class Client
    module Functions

      #
      # Public: Returns extended information for a given function identified from its ID.
      #
      # id - A String that represent the function ID.
      #
      # Returns Hashie The function.
      #
      def function(id)
        get("/functions/#{id}")
      end

      #
      # Public: Returns a list of owned functions.
      #
      # params - The Hash used to refine the search (default: {}).
      #
      # Returns Array List of functions.
      #
      def functions(params = {})
        get('/functions', params)
      end

      #
      # Public: Returns a list of all existing functions.
      #
      # params - The Hash used to refine the search (default: {}).
      #
      # Returns Array List of functions.
      #
      def public_functions(params = {})
        get('/functions/public', params)
      end

      #
      # Public: Create a function and returns extended information for it.
      #
      # params - The Hash used to create the resource (default: {}).
      #
      # Returns Hashie The created function.
      #
      def create_function(params = {})
        post('/functions', params)
      end

      #
      # Public: Update a function identified from its ID and returns extended information for it.
      #
      # id - A String that represent the function ID.
      # params - The Hash used to update the resource (default: {}).
      #
      # Returns Hashie The updated function.
      #
      def update_function(id, params = {})
        put("/functions/#{id}", params)
      end

      #
      # Public: Delete a function identified from its ID and returns extended information for it.
      #
      # id - A String that represent the function ID.
      #
      # Returns Hashie The deleted function.
      #
      def delete_function(id)
        delete("/functions/#{id}")
      end
    end
  end
end
