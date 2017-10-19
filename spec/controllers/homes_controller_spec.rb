require 'rails_helper'

describe HomesController, type: :controller do
  describe "/home" do
    context "when user is logged in" do
      before(:each) do
        session[:employee_id] = 6
      end
      it 'returns a 200 status code' do
        get :home
        expect(response.status).to eq 200
      end
      it 'shows the homepage' do
        expect(get :home).to render_template(:home)
      end
    end
    context "when user is not logged in" do
      it 'renders a 302 status code' do
        get :home
        expect(response.status).to eq 302
      end
      xit 'redirects to login url' do
        get :home
        expect(response).to redirect_to(login_path)
      end
      xit 'shows the login page' do
        expect(get :home).to render_template(:login)
      end
    end
  end

end
