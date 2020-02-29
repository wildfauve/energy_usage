module Contract

  class ProvisioningService

    include Dry::Monads::Result::Mixin

    def call(party:, supply_node:)
      Success(contract.new(party, supply_node))
    end

    private

    def contract
      Contract
    end

  end

end
