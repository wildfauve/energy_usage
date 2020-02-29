module Telemetry

  class NodeMeasurementValue < Dry::Struct

    attribute :node_identity,         Types::String
    attribute :measurement,           Types::Float
    attribute :unit,                  Types::Symbol
    attribute :conversion_fn,         Types::Symbol


  end

end
