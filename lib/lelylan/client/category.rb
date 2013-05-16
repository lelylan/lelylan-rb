module Lelylan
  class Client
    module Category

      # Public: Returns a list of categories related to owned devices.
      #
      # params - The Hash used to refine the search (default: {}).
      #
      # Returns Array list of categories.
      #
      def categories(params = {})
        get('/categories', params)
      end
    end
  end
end
