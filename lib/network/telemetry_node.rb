require 'securerandom'

module Network

  class TelemetryNode

    attr_reader :identity

    class << self
      def configure
        self.new
      end
    end

    def initialize
      @identity = SecureRandom.uuid
    end

  end

end
