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
      it 'returns a status of 200' do
      get :index
      expect(response.status).to be 200
    end
    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  context "GET orders#create" do
  end

  context "GET orders#show" do
    it "takes id parameters" do
      get :show, params: {id: order.id}
      expect(assigns(:order)).to eq Order.find(order.id)
    end
    # it "returns a status of 200" do
    #   get :show, params: {id: order.id}
    # end
    # it "renders the :index template" do
    #   get :show, params: {id: order.id}
    # end
  end

  context "GET orders#edit" do
  end

  context "GET orders#update" do
  end

end
