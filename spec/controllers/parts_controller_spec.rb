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

  context "POST parts#create" do
    it 'creates a new part' do
      post :create, params: {quantity: [1], part_desc: ["86951-Fan"]}
      expect(Part.last.name).to eq "Fan"
    end
    it 'renders the :new template upon failure' do
      post :create, params: {quantity: [0]}
      expect(response).to render_template :new
    end
  end





  context "GET parts#create"
end
