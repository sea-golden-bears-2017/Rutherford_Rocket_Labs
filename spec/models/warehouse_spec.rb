require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  warehouse = Warehouse.create!(city: "Phoenix", location_code: "Phoenix-1")

  context 'Warehouse has:' do
    it "a city" do
      expect(warehouse.city).to eq "Phoenix"
    end
    it "a location_code" do
      expect(warehouse.location_code).to eq "Phoenix-1"
    end
  end

  context "Warehouse is created if:" do
    it "has a name" do
      expect(warehouse.city).to eq "Phoenix"
    end
    it "has a location_code" do
      expect(warehouse.location_code).to eq "Phoenix-1"
    end
  end



end
