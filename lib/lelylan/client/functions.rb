module Lelylan
  class Client
    module Functions

      # Public: Returns extended information for a given function identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/types/functions/#get Lelylan Dev Center}.
      #
      # function - A String that represent the function URI.
      #
      # Returns Hashie The function.
      #
      # Examples
      #
      #   function = "http://api.lelylan.com/functions/4dcb9e23d033a9088902200a"
      #   client.function(function)
      #
      def function(function)
        get("/functions/#{find_id(function)}")
      end

      # Public: Returns a list of functions.
      # Find more at {http://dev.lelylan.com/rest/types/functions/#all Lelylan Dev Center}.
      #
      # options - The Hash option used to refine the search (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/functions/#all API doc} for the accepted options.
      # 
      # Returns Hashie List of functions.
      #
      # Examples
      # 
      #   # Retrurns the first 10 functions
      #   client.functions(per: 10)
      #
      #   # Returns the functions where the name match with the desired string
      #   client.functions(name: 'Turn on')
      #
      def functions(options = {})
        get("/functions", options)
      end

      # Public: Returns a list of all public functions.
      # Find more at {http://dev.lelylan.com/rest/functions/core/#all Lelylan Dev Center}.
      #
      # options - The Hash option used to refine the search (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/functions/#all API doc} for the accepted options.
      # 
      # Returns Hashie List of functions.
      #
      # Examples
      # 
      #   # Retrurns the first 10 public functions
      #   client.public_functions(per: 10)
      #
      def public_functions(options = {})
        get("/functions/public", options)
      end

      # Public: Create a function and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/functions/#create Lelylan Dev Center}.
      #
      # options - The Hash option used to create the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/functions/#create API doc} for the accepted options.
      # 
      # Returns Hashie The created function.
      #
      # Examples
      # 
      #   # device properties
      #   status    = https://api.lelylan.com/properties/4dcb9e23d033a9088902200b"
      #   intensity = https://api.lelylan.com/properties/4dcb9e23d033a9088902200c"
      #   # values the function is going to set
      #   properties = [{uri: status, value: 'on'}, {uri: intensity}]
      #   # create the function
      #   client.create_function(name: 'Set intensity', properties: properties)
      #
      def create_function(options = {})
        post("/functions", options)
      end

      # Public: Update a function identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/functions/#update Lelylan Dev Center}.
      #
      # function - A String that represents the function URI.
      # options - The Hash option used to update the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/functions/#update API doc} for the accepted options.
      # 
      # Returns Hashie The updated function.
      #
      # Examples
      # 
      #   function = "http://api.lelylan.com/functions/4dcb9e23d033a9088902200d"
      #   client.update_function(function, name: 'Set intensity')
      #
      def update_function(function, options = {})
        put("/functions/#{find_id(function)}", options)
      end

      # Public: Delete a function identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/functions/#delete Lelylan Dev Center}.
      #
      # function - A String that represent the function URI.
      # 
      # Returns Hashie The deleted function.
      #
      # Examples
      # 
      #   function = "http://api.lelylan.com/functions/4dcb9e23d033a9088902200a"
      #   client.delete_function(function)
      #
      def delete_function(function)
        delete("/functions/#{find_id(function)}")
      end
    end
  end
end



