require 'rails_helper'

describe OrdersController, type: :controller do
  # describe 'orders#new' do
  #   before(:each) do
  #     get :new
  #   end
  #   it 'responds with a 200 status code' do
  #     expect(response.status).to eq 200
  #   end
  #
  #   it 'renders a new orders template' do
  #     expect(response).to render_template(:new)
  #   end
  # end
  let!(:warehouse) {Warehouse.create!(city: "Phoenix", location_code: 1)}
  let!(:employee) {Employee.create!(first_name: "Dr", last_name: "Rutherford", employee_id: 0000, password: "commissioner", is_manager: true, warehouse: warehouse)}
  let!(:order) {Order.create!(description: "bob", warehouse: warehouse, employee: employee)}
  let!(:part) {Part.create!(part_no: 12345, name: "bob", warehouse: warehouse, order_id: order)}

  context "GET orders#index" do
    it "return the same order as the one provided" do
      get :index
      expect(Order.all.last).to eq order
    end
  end

  context "GET orders#index"

end
