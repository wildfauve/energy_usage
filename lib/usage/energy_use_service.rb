module Usage

  class EnergyUseService

    include Dry::Monads::Result::Mixin

    # Takes a contract as the context for supply.
    # Returns a result wrapped in a Monad
    def call(contract:)
      Success(measurements(contract.supply_node))
    end

    private

    def measurements(supply_node)
      (
        Fn.inject.({}, aggregate) <<
        -> lazy_enum { lazy_enum.first(20) } <<
        Monad.lift
      ).(measurement_stream(supply_node))
    end

    def aggregate
      -> acc, measure {
        Fn.inject.(0, node_aggregate).(measure[:nodes])
      }.curry
    end

    def node_aggregate
      -> acc, node_measure { acc += conversion_fn_factory(node_measure[:conversion_fn]).(node_measure[:measurement]) }.curry
    end

    # simulates an event stream of measurements by requesting the Telemetry service to generate a lazy enumerable
    # of random telemetry value objects.
    def measurement_stream(supply_node)
      mesaurement_stream.measurement_for(supply_node: supply_node)
    end

    def conversion_fn_factory(fn)
      Usage::ConversionFunctions.function_factory(fn)
    end

    def mesaurement_stream
      Telemetry::MeasurementStreamService
    end
  end

end
