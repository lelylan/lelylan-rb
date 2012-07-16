module Lelylan
  class Client
    module Statuses

      # Public: Returns extended information for a given status identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/types/statuses/#get Lelylan Dev Center}.
      #
      # status - A String that represent the status URI.
      #
      # Returns Hashie The status.
      #
      # Examples
      #
      #   status = "http://api.lelylan.com/statuses/4dcb9e23d033a9088902200a"
      #   client.status(status)
      #
      def status(status)
        get("/statuses/#{find_id(status)}")
      end

      # Public: Returns a list of statuses.
      # Find more at {http://dev.lelylan.com/rest/types/statuses/#all Lelylan Dev Center}.
      #
      # options - The Hash option used to refine the search (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/statuses/#all API doc} for the accepted options.
      # 
      # Returns Hashie List of statuses.
      #
      # Examples
      # 
      #   # Retrurns the first 10 statuses
      #   client.statuses(per: 10)
      #
      #   # Returns the statuses where the name match with the desired string
      #   client.statuses(name: 'Setting')
      #
      def statuses(options = {})
        get("/statuses", options)
      end

      # Public: Create a status and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/statuses/#create Lelylan Dev Center}.
      #
      # options - The Hash option used to create the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/statuses/#create API doc} for the accepted options.
      # 
      # Returns Hashie The created status.
      #
      # Examples
      # 
      #   client.create_status(name: 'Setting status')
      #
      def create_status(options = {})
        post("/statuses", options)
      end

      # Public: Update a status identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/statuses/#update Lelylan Dev Center}.
      #
      # status - A String that represents the status URI.
      # options - The Hash option used to update the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/statuses/#update API doc} for the accepted options.
      # 
      # Returns Hashie The updated status.
      #
      # Examples
      # 
      #   status = "http://api.lelylan.com/statuses/4dcb9e23d033a9088902200a"
      #   client.update_status(status, pending: true)
      #
      def update_status(status, options = {})
        put("/statuses/#{find_id(status)}", options)
      end

      # Public: Delete a status identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/statuses/#delete Lelylan Dev Center}.
      #
      # status - A String that represent the status URI.
      # 
      # Returns Hashie The deleted status.
      #
      # Examples
      # 
      #   status = "http://api.lelylan.com/statuses/4dcb9e23d033a9088902200a"
      #   client.delete_status(status)
      #
      def delete_status(status)
        delete("/statuses/#{find_id(status)}")
      end
    end
  end
end

