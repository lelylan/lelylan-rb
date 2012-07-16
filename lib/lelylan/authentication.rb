module Lelylan
  module Authentication
    def authentication
      if user && password
        {:user => user, :password => password}
      else
        {}
      end
    end

    def authenticated?
      !authentication.empty?
    end

    def oauthed?
      !oauth_token.nil?
    end
  end
end
