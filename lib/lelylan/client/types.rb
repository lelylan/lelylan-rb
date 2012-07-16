module Lelylan
  class Client
    module Types

      # Public: Returns extended information for a given type identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/types/core/#get Lelylan Dev Center}.
      #
      # type - A String that represent the type URI.
      #
      # Returns Hashie The type.
      #
      # Examples
      #
      #   type = "http://api.lelylan.com/types/4dcb9e23d033a9088902200a"
      #   client.type(type)
      #
      def type(type)
        get("/types/#{find_id(type)}")
      end

      # Public: Returns a list of owned types.
      # Find more at {http://dev.lelylan.com/rest/types/core/#all Lelylan Dev Center}.
      #
      # options - The Hash option used to refine the search (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/types/#all API doc} for the accepted options.
      # 
      # Returns Hashie List of types.
      #
      # Examples
      # 
      #   # Retrurns the first 10 types
      #   client.types(per: 10)
      #
      #   # Returns the types where the name match with the desired string
      #   client.types(name: 'dimmer')
      #
      def types(options = {})
        get("/types", options)
      end

      # Public: Returns a list of all public types.
      # Find more at {http://dev.lelylan.com/rest/types/core/#all Lelylan Dev Center}.
      #
      # options - The Hash option used to refine the search (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/types/#all API doc} for the accepted options.
      # 
      # Returns Hashie List of types.
      #
      # Examples
      # 
      #   # Retrurns the first 10 public types
      #   client.public_types(per: 10)
      #
      def public_types(options = {})
        get("/types/public", options)
      end

      # Public: Create a type and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/core/#create Lelylan Dev Center}.
      #
      # options - The Hash option used to create the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/core/#create API doc} for the accepted options.
      # 
      # Returns Hashie The created type.
      #
      # Examples
      # 
      #   client.create_type(name: 'Dimmer')
      #
      def create_type(options = {})
        post("/types", options)
      end

      # Public: Update a type identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/core/#update Lelylan Dev Center}.
      #
      # type - A String that represents the type URI.
      # options - The Hash option used to update the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/core/#update API doc} for the accepted options.
      # 
      # Returns Hashie The updated type.
      #
      # Examples
      # 
      #   type = "http://api.lelylan.com/types/4dcb9e23d033a9088902200a"
      #   client.update_type(type, name: 'RGB Dimmer')
      #
      def update_type(type, options = {})
        put("/types/#{find_id(type)}", options)
      end

      # Public: Delete a type identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/core/#delete Lelylan Dev Center}.
      #
      # type - A String that represent the type URI.
      # 
      # Returns Hashie The deleted type.
      #
      # Examples
      # 
      #   type = "http://api.lelylan.com/types/4dcb9e23d033a9088902200a"
      #   client.delete_type(type)
      #
      def delete_type(type)
        delete("/types/#{find_id(type)}")
      end
    end
  end
end
