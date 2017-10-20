require 'rails_helper'

RSpec.describe WarehousesController, type: :controller do
  let!(:warehouse) {Warehouse.create!(city: "Phoenix", location_code: 1)}

  context "GET warehouse#new" do
    it "responds with status code 302 if manager_logged_in is false" do
      get :new
      expect(response.status).to eq 302
    end
    it "responds with status code 200 if manager_logged_in is true" do
      employee = Employee.create(first_name: "Dr", last_name: "Rutherford", employee_id: 0000, password: "commissioner", is_manager: true, warehouse: warehouse)
      session[:user_id] = employee.id
      get :new
      expect(response.status).to eq 200
    end
  end

  context "POST warehouse#create" do
    it "creates a new warehouse" do
      post :create, params: {warehouse: {city: "Mars"}}
      expect(Warehouse.last.city).to eq "Mars"
    end
    it "returns a 302 response" do
      post :create, params: {warehouse: {city: "Mars"}}
      expect(response.status).to eq 302
    end
    it "redirects to the confirmation page when creation is successful" do
      post :create, params: {warehouse: {city: "Saturn"}}
      expect(response).to redirect_to confirmation_path(Warehouse.last)
    end
  end

  context "GET warehouse#confirmation" do
    it "finds a warehouse and assigns it to @warehouse" do
      get :confirmation, params: {id: warehouse.id}
      expect(assigns(:warehouse)).to eq Warehouse.find(warehouse.id)
    end
  end

end
