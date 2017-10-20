require 'rails_helper'

describe Order, type: :model do
  let!(:warehouse)  { Warehouse.create!(city: "Denver", location_code: "DEN-00002") }
  let!(:employee) { create(:employee, is_manager: true,  warehouse: warehouse) }
  let(:order) { Order.create(description:  "my rocket order", warehouse: warehouse, employee: employee) }
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
    it "belongs to the employee that created it" do
      expect(order.employee).to eq employee
    end
    it "has many parts" do
      expect(order.parts).to match parts_array
    end
    it 'employee has many orders' do
      order1 = order
      expect(employee.orders).to include order1
    end
    it 'part belongs to an order' do
      order1 = order
      expect(parts.first.order).to eq order1
    end
  end
end
