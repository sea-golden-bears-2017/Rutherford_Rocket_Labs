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
    it 'successfully creates an Employee' do
      post :create, params: {employee: {first_name: "Blaine", last_name: "Anderson", employee_id: 1000, password: "blaine", warehouse_id: warehouse, is_manager: true}}
      expect(Employee.last.first_name).to eq "Blaine"
    end
    it "responds with status code 302 if Employee is created successfully" do
      post :create, params: {employee: {first_name: "Blaine", last_name: "Anderson", employee_id: 1000, password: "blaine", warehouse_id: warehouse, is_manager: false}}
      expect(response.status).to eq 302
    end
    # it 'fails to creates an Employee' do
    #   post :create, params: {employee: {first_name: "", last_name: "Anderson2", employee_id: 1000, password: "blaine2", warehouse_id: warehouse, is_manager: false}}
      # expect(employee.valid?).to eq false
      # expect(employee.save!).to raise_error(ActiveRecord::RecordInvalid,"Validation failed: First name can't be blank")
    # end
    it "responds with status code 200 if Employee is created unsuccessfully" do
      post :create, params: {employee: {first_name: "Blaine", last_name: "Anderson", employee_id: 1000, password: "blaine", warehouse_id: warehouse, is_manager: true}}
      expect(response.status).to eq 200
    end
  end

  context "GET employees#confirmation" do
    it "finds a employee and assigns it to @employee" do
      get :confirmation, params: {id: employee.id}
      expect(assigns(:employee)).to eq Employee.find(employee.id)
    end
  end









end
