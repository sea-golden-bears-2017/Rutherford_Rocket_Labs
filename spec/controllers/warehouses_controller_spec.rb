require 'rails_helper'

RSpec.describe WarehousesController, type: :controller do
  warehouse = Warehouse.create!(city: "Phoenix", location_code: 1)

  context "GET #warehouse" do
    it "responds with status code 302 if manager_logged_in is false" do
      get :new
      expect(response.status).to eq 302
    end
    it "responds with status code 200 if manager_logged_in is true" do
      employee = Employee.create(first_name: "Dr", last_name: "Rutherford", employee_id: 0000, password: "commissioner", is_manager: true, warehouse: warehouse)
      get :new, { create: }
      expect(response.status).to eq 200
    end
    it "assigns the last warehouse as @warehouse" do
      get :create, params: {warehouse: {city: "Phoenix"}}
      expect(assigns(:warehouse)).to eq Warehouse.last
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end



end
