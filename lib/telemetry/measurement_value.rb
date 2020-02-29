require_relative 'types'

module Telemetry

  class MeasurementValue < Dry::Struct

    attribute :time,          Types::Time
    attribute :nodes,         Types::Array

  end

end
