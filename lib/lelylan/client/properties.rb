module Lelylan
  class Client
    module Properties

      # Public: Returns extended information for a given property identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/types/properties/#get Lelylan Dev Center}.
      #
      # property - A String that represent the property URI.
      #
      # Returns Hashie The property.
      #
      # Examples
      #
      #   property = "http://api.lelylan.com/properties/4dcb9e23d033a9088902200a"
      #   client.property(property)
      #
      def property(property)
        get("/properties/#{find_id(property)}")
      end

      # Public: Returns a list of properties.
      # Find more at {http://dev.lelylan.com/rest/types/properties/#all Lelylan Dev Center}.
      #
      # options - The Hash option used to refine the search (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/properties/#all API doc} for the accepted options.
      # 
      # Returns Hashie List of properties.
      #
      # Examples
      # 
      #   # Retrurns the first 10 properties
      #   client.properties(per: 10)
      #
      #   # Returns the properties where the name match with the desired string
      #   client.properties(name: 'Intensity')
      #
      def properties(options = {})
        get("/properties", options)
      end

      # Public: Returns a list of properties.
      # Find more at {http://dev.lelylan.com/rest/properties/properties/#all Lelylan Dev Center}.
      #
      # options - The Hash option used to refine the search (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/properties/properties/#all API doc} for the accepted options.
      # 
      # Returns Hashie List of properties.
      #
      # Examples
      # 
      #   # Retrurns the first 10 properties
      #   client.properties(per: 10)
      #
      #   # Returns the properties where the name match with the desired string
      #   client.properties(name: 'Intensity')
      #
      def public_properties(options = {})
        get("/properties/public", options)
      end

      # Public: Create a property and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/properties/#create Lelylan Dev Center}.
      #
      # options - The Hash option used to create the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/properties/#create API doc} for the accepted options.
      # 
      # Returns Hashie The created property.
      #
      # Examples
      #
      #   values = 1..100.to_a # [0, 1, 2, 3, 4, ..., 99, 100]
      #   client.create_property(name: 'Intensity', default: '0', values: values)
      #
      def create_property(options = {})
        post("/properties", options)
      end

      # Public: Update a property identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/properties/#update Lelylan Dev Center}.
      #
      # property - A String that represents the property URI.
      # options - The Hash option used to update the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/properties/#update API doc} for the accepted options.
      # 
      # Returns Hashie The updated property.
      #
      # Examples
      # 
      #   property = "http://api.lelylan.com/properties/4dcb9e23d033a9088902200a"
      #   client.update_property(property, default: '100')
      #
      def update_property(property, options = {})
        put("/properties/#{find_id(property)}", options)
      end

      # Public: Delete a property identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/properties/#delete Lelylan Dev Center}.
      #
      # property - A String that represent the property URI.
      # 
      # Returns Hashie The deleted property.
      #
      # Examples
      # 
      #   property = "http://api.lelylan.com/properties/4dcb9e23d033a9088902200a"
      #   client.delete_property(property)
      #
      def delete_property(property)
        delete("/properties/#{find_id(property)}")
      end
    end
  end
end


