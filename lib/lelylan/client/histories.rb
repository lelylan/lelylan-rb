module Lelylan
  class Client
    module Histories

      #
      # Public: Returns extended information for a given history identified from its ID.
      #
      # id - A String that represent the history ID.
      #
      # Returns Hashie The history.
      #
      def find_history(id)
        get("/histories/#{id}")
      end

      #
      # Public: Returns a list of histories related to owned devices.
      #
      # params - The Hash used to refine the search (default: {}).
      #
      # Returns Array List of histories.
      #
      def all_histories(params = {})
        get('/histories', params)
      end
    end
  end
end
