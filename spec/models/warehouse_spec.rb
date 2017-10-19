require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  warehouse = Warehouse.create!(city: "Phoenix", location_id: 1)

  context 'Warehouse has:' do
    it "a city" do
      expect(warehouse.city).to eq "Phoenix"
    end
    it "a location_id" do
      expect(warehouse.location_id).to eq 1
    end
  end
end
