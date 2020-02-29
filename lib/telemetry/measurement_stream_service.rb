require 'dry-struct'

module Telemetry

  class MeasurementStreamService

    include Dry::Monads::Result::Mixin

    class << self

      def measurement_for(supply_node:)
        self.new.(telemetry_nodes: supply_node.telemetry_nodes)
      end
    end

    def call(telemetry_nodes:)
      Success(stream(telemetry_nodes))
    end

    private

    def stream(nodes)
      (Fn.map.(seed_telemetry.(nodes)).(1..1000)).lazy
    end

    def seed_telemetry
      -> nodes, x { telemetry_unit.(Time.now - (x * 60 * 30), nodes) }.curry
    end

    def telemetry_unit
      -> time, nodes {
        MeasurementValue.new(time: time.utc, nodes: Fn.map.(node_measurement).(nodes))
      }
    end

    def node_measurement
      -> node { node_measurement_value.new(node_identity: node.identity, measurement: rand(2.0...50.0).round(2), unit: :kwh, conversion_fn: :identity) }
    end

    def measurement_value
      MeasurementValue
    end

    def node_measurement_value
      NodeMeasurementValue
    end
  end

end
