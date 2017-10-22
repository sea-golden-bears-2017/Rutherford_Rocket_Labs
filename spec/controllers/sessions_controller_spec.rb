require 'rails_helper'

describe SessionsController, type: :controller do
  describe "POST /login a.k.a sessions#create" do
      let!(:warehouse) { create(:warehouse) }
      let!(:employee) { create(:employee, warehouse: warehouse)}
    context "when employee enters correct login info" do
      it "responds with status code of 302" do
        post :create, { params: {employee_id: 12345, password: "password"} }
        expect(response).to have_http_status 302
      end
      it "adds employee's id as :user_id to session" do
        post :create, { params: {employee_id: 12345, password: "password"} }
        expect(session[:user_id]).to eq Employee.find_by(employee_id: 12345).id
      end
    end
    context "when employee enters incorrect login info" do
      it "responds with status code of 200 (reloads login page)" do
        post :create, { params: {employee_id: 1, password: "flamingo"} }
        expect(response).to have_http_status 200
      end
      it "sets error message" do
        post :create, { params: {employee_id: 1, password: "flamingo"} }
        expect(assigns(:error)).to eq 'The employee number or password entered is incorrect.'
      end
      it ":user_id in session remains blank" do
        post :create, { params: {employee_id: 1, password: "flamingo"} }
        expect(session[:user_id]).to be nil
      end
      it 'returns a status of 302 when destory route is called' do
        delete :destroy
        expect(response.status).to be 302
      end
      it ':user_id is cleared when destroy route is called' do
        delete :destroy
        expect(session).to be_empty
      end
      it 'returns a status of 200 when new route is called' do
        get :new
        expect(response.status).to be 200
      end
      it 'renders :new template when new route is called'
    end
  end
end
