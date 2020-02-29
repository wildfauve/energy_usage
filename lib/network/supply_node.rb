module Network

  class SupplyNode

    class << self

      def find
        self.new
      end

    end

    def identity
      "ICP1"
    end

    def telemetry_nodes
      [telemetry_node.configure, telemetry_node.configure]
    end

    def telemetry_node
      TelemetryNode
    end
  end

end
