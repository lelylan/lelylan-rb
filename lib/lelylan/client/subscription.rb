module Lelylan
  class Client
    module Subscription

      #
      # Public: Returns extended information for a given subscription identified from its ID.
      #
      # id - A String that represent the subscription ID.
      #
      # Returns Hashie The subscription.
      #
      def subscription(id)
        get("/subscriptions/#{id}")
      end

      #
      # Public: Returns a list of owned subscriptions.
      #
      # params - The Hash used to refine the search (default: {}).
      #
      # Returns Array List of subscriptions.
      #
      def subscriptions(params = {})
        get('/subscriptions', params)
      end

      #
      # Public: Create a subscription and returns extended information for it.
      #
      # params - The Hash used to create the resource (default: {}).
      #
      # Returns Hashie The created subscription.
      #
      def create_subscription(params = {})
        post('/subscriptions', params)
      end

      #
      # Public: Update a subscription identified from its ID and returns extended information for it.
      #
      # id - A String that represent the subscription ID.
      # params - The Hash used to update the resource (default: {}).
      #
      # Returns Hashie The updated subscription.
      #
      def update_subscription(id, params = {})
        put("/subscriptions/#{id}", params)
      end

      #
      # Public: Delete a subscription identified from its ID and returns extended information for it.
      #
      # id - A String that represent the subscription ID.
      #
      # Returns Hashie The deleted subscription.
      #
      def delete_subscription(id)
        delete("/subscriptions/#{id}")
      end
    end
  end
end
