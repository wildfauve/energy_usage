describe "Usage For Period" do

  context "For some randomised intervals" do
    before do
      # The contract is the temporal association between the customer and the supply
      # It is the access context which can be injected into the usage service.
      @contract = Contract::ProvisioningService.new.(party: Customer::Party.find, supply_node: Network::SupplyNode.find).value_or
    end

    it 'calcs usage based on some randomised data' do

      usage = Usage::EnergyUseService.new.(contract: @contract)

      expect(usage).to be_success

      expect(usage.value_or).to be_instance_of Float

    end

  end
end
