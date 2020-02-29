require 'dry-struct'

module Telemetry

  module Types
    include Dry.Types(default: :nominal)

  end

end
