module Lelylan
  class Client
    module Categories

      # Public: Returns extended information for a given category identified from its URI.
      # Find more at {http://dev.lelylan.com/rest/types/categories/#get Lelylan Dev Center}.
      #
      # category - A String that represent the category URI.
      #
      # Returns Hashie The category.
      #
      # Examples
      #
      #   category = "http://api.lelylan.com/categories/4dcb9e23d033a9088902200a"
      #   client.category(category)
      #
      def category(category)
        get("/categories/#{find_id(category)}")
      end

      # Public: Returns a list of categories.
      # Find more at {http://dev.lelylan.com/rest/types/categories/#all Lelylan Dev Center}.
      #
      # options - The Hash option used to refine the search (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/categories/#all API doc} for the accepted options.
      # 
      # Returns Hashie List of categories.
      #
      # Examples
      # 
      #   # Retrurns the first 10 categories
      #   client.categories(per: 10)
      #
      #   # Returns the categories where the name match with the desired string
      #   client.categories(name: 'Lighting')
      #
      def categories(options = {})
        get("/categories", options)
      end

      # Public: Returns a list of all public categories.
      # Find more at {http://dev.lelylan.com/rest/categories/core/#all Lelylan Dev Center}.
      #
      # options - The Hash option used to refine the search (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/devices/categories/#all API doc} for the accepted options.
      # 
      # Returns Hashie List of categories.
      #
      # Examples
      # 
      #   # Retrurns the first 10 public categories
      #   client.public_categories(per: 10)
      #
      def public_categories(options = {})
        get("/categories/public", options)
      end

      # Public: Create a category and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/categories/#create Lelylan Dev Center}.
      #
      # options - The Hash option used to create the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/categories/#create API doc} for the accepted options.
      # 
      # Returns Hashie The created category.
      #
      # Examples
      #
      #   client.create_category(name: 'Lighting')
      #
      def create_category(options = {})
        post("/categories", options)
      end

      # Public: Update a category identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/categories/#update Lelylan Dev Center}.
      #
      # category - A String that represents the category URI.
      # options - The Hash option used to update the resource (default: {}). 
      #           Check out the {http://dev.lelylan.com/rest/types/categories/#update API doc} for the accepted options.
      # 
      # Returns Hashie The updated category.
      #
      # Examples
      # 
      #   category = "http://api.lelylan.com/categories/4dcb9e23d033a9088902200a"
      #   client.update_category(category, name: 'Lighting RGB')
      #
      def update_category(category, options = {})
        put("/categories/#{find_id(category)}", options)
      end

      # Public: Delete a category identified from its URI and returns extended information for it.
      # Find more at {http://dev.lelylan.com/rest/types/categories/#delete Lelylan Dev Center}.
      #
      # category - A String that represent the category URI.
      # 
      # Returns Hashie The deleted category.
      #
      # Examples
      # 
      #   category = "http://api.lelylan.com/categories/4dcb9e23d033a9088902200a"
      #   client.delete_category(category)
      #
      def delete_category(category)
        delete("/categories/#{find_id(category)}")
      end
    end
  end
end



