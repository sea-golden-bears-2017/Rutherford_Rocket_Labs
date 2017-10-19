require 'rails_helper'

RSpec.describe WarehousesController, type: :controller do
  warehouse = Warehouse.create!(city: "Phoenix", location_id: 1)

  context "GET #warehouse" do
    it "responds with status code 200" do
      get :new
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
