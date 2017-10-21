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

  context "GET employees#create"
  context "GET employees#confirmation"










end
