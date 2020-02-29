describe "Usage For Period" do

  context "For this month" do
    before do
      @contract = Contract::ProvisioningService.new.(party: Customer::Party.find, supply_node: Network::SupplyNode.find).value_or
    end

    it 'calcs usage based on some randomised data' do

      usage = Usage::EnergyUseService.new.(contract: @contract)

      expect(usage).to be_success

      expect(usage.value_or).to be_instance_of Float

    end

  end
end
