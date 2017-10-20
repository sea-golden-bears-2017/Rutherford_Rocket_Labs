require 'rails_helper'

describe Order, type: :model do
  let!(:warehouse) { create(:warehouse) }
  let!(:manager) { create(:manager, warehouse: warehouse) }
  let(:order) { create(:order, warehouse: warehouse, manager: manager) }
  let(:parts) { create_list(:part, 3, warehouse: warehouse, order: order) }
  let(:parts2) { create_list(:part, 3, part_no: 11111, name: "generic tool", warehouse: warehouse, order: order) }
  let(:parts_array) {parts + parts2}
  describe "attributes and associations" do
    it "has a description" do
      expect(order.description).to be_a String
    end
    it "has a generated name" do
      expect(order.order_name).to be_a String
    end
    it "belongs to a warehouse" do
      expect(order.warehouse).to eq warehouse
    end
    it "belongs to the manager that created it" do
      expect(order.manager).to eq manager
    end
    it "has many parts" do
      expect(order.parts).to match parts_array
    end
  end
end
