module Lelylan
  class Client
    module Statuses

      #
      # Public: Returns extended information for a given status identified from its ID.
      #
      # id - A String that represent the status ID.
      #
      # Returns Hashie The status.
      #
      def status(id)
        get("/statuses/#{id}")
      end

      #
      # Public: Returns a list of owned statuses.
      #
      # params - The Hash used to refine the search (default: {}).
      #
      # Returns Array List of statuses.
      #
      def statuses(params = {})
        get('/statuses', params)
      end

      #
      # Public: Returns a list of all existing statuses.
      #
      # params - The Hash used to refine the search (default: {}).
      #
      # Returns Array List of statuses.
      #
      def public_statuses(params = {})
        get('/statuses/public', params)
      end

      #
      # Public: Create a status and returns extended information for it.
      #
      # params - The Hash used to create the resource (default: {}).
      #
      # Returns Hashie The created status.
      #
      def create_status(params = {})
        post('/statuses', params)
      end

      #
      # Public: Update a status identified from its ID and returns extended information for it.
      #
      # id - A String that represent the status ID.
      # params - The Hash used to update the resource (default: {}).
      #
      # Returns Hashie The updated status.
      #
      def update_status(id, params = {})
        put("/statuses/#{id}", params)
      end

      #
      # Public: Delete a status identified from its ID and returns extended information for it.
      #
      # id - A String that represent the status ID.
      #
      # Returns Hashie The deleted status.
      #
      def delete_status(id)
        delete("/statuses/#{id}")
      end
    end
  end
end

