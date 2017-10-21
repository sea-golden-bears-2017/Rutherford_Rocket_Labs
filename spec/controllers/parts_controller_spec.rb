require 'rails_helper'

RSpec.describe PartsController, type: :controller do
  let!(:warehouse) {Warehouse.create!(city: "Phoenix", location_code: 1)}
  let!(:employee) {Employee.create(first_name: "Dr", last_name: "Rutherford", employee_id: 0000, password: "commissioner", is_manager: true, warehouse: warehouse)}

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


end
