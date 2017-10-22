require 'rails_helper'

RSpec.describe PartsController, type: :controller do
  let!(:warehouse) {Warehouse.create!(city: "Phoenix", location_code: 1)}
  let!(:employee) {Employee.create(first_name: "Dr", last_name: "Rutherford", employee_id: 0000, password: "commissioner", is_manager: true, warehouse: warehouse)}
  let!(:order) {Order.create(description: "bob", warehouse: warehouse, employee: employee)}

  context "GET parts#index" do
    it "responds with status code 302 if logged_in? is false" do
      get :index
      expect(response.status).to eq 302
    end
    it "responds with status code 200 if logged_in? is true" do
      session[:user_id] = employee.id
      get :index
      expect(response.status).to eq 200
    end
  end

  context "GET parts#new" do
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
    it 'responds with a status of 200' do
      get :new
      expect(response.status).to eq 200
    end
  end

  context "GET parts#create" do
    # it 'creates a new part' do
    #   post :create, params: {part: {part_no: 12345, name: "Whatever", warehouse_id: warehouse}, quantity: [1]}
    #   p "*" * 100
    #   p part
    #   p Part.last
    #   expect(Part.last.name).to eq "12345-Whatever"
    # end
    # it 'responds with a status code of 200 if parts create_parts = nil'
    # it 'responds with a status code of 302 if parts create_parts is not nil'
  end





  context "GET parts#create"
end
