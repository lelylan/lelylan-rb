module Lelylan
  class Version
    MAJOR = 0 unless defined? MAJOR
    MINOR = 0 unless defined? MINOR
    PATCH = 3 unless defined? PATCH
    PRE = nil unless defined? PRE

    class << self

      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end
    end
  end
end
