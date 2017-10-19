require 'rails_helper'

describe SessionsController, type: :controller do
  describe "POST /login a.k.a sessions#create" do
      let!(:employee) { Employee.create(employee_id: 123, password: "password") }
    context "when employee enters correct login info" do
      it "responds with status code of 302" do
        post :create, { params: {employee_id: 123, password: "password"} }
        expect(response).to have_http_status 302
      end
      it "adds employee's id as :user_id to session" do
        post :create, { params: {employee_id: 123, password: "password"} }
        expect(session[:user_id]).to be Employee.find_by(employee_id: 123).id
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
    end
  end
end
