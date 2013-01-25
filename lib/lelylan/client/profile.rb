module Lelylan
  class Client
    module Profile

      #
      # Public: Returns extended information for a given type identified from its ID.
      #
      # id - A String that represent the type ID.
      #
      # Returns Hashie The type.
      #
      def me()
        get('/me')
      end
    end
  end
end
