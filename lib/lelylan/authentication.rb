module Lelylan
  module Authentication
    def authentication
      token ? { token: token } : {}
    end

    def authenticated?
      !authentication.empty?
    end
  end
end
