require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  let!(:warehouse) {Warehouse.create!(city: "Phoenix", location_code: 1)}
  let!(:employee) {Employee.create(first_name: "Dr", last_name: "Rutherford", employee_id: 0000, password: "commissioner", is_manager: true, warehouse: warehouse)}

  context "GET employees#new" do
    it "responds with status code 302 if manager_logged_in is false" do
      get :new
      expect(response.status).to eq 302
    end
    it "responds with status code 200 if manager_logged_in is true" do
      session[:user_id] = employee.id
      get :new
      expect(response.status).to eq 200
    end
  end

  context "GET employees#create" do
    it "creates a new employee" do
      session[:user_id] = employee.id
      expect(Employee.last.first_name).to eq "Dr"
    end
    xit "returns a 302 response" do
      post :create, params: {warehouse: {city: "Mars"}}
      expect(response.status).to eq 302
    end
    xit "redirects to the confirmation page when creation is successful" do
      post :create, params: {warehouse: {city: "Saturn"}}
      expect(response).to redirect_to confirmation_path(Warehouse.last)
    end
    xit 'fails to create a warehouse and renders :new' do
      post :create, params: {warehouse: {city: nil}}
      expect(response).to render_template(:new)
    end
  end

  context "GET employees#confirmation"










end
