require 'rails_helper'

describe HomesController, type: :controller do
  describe "/home" do
    context "when user is logged in" do
      before(:each) do
        session[:user_id] = 6
      end
      it 'returns a 200 status code' do
        get :show
        expect(response.status).to eq 200
      end
      it 'shows the homepage' do
        expect(get :show).to render_template(:home)
      end
    end
    context "when user is not logged in" do
      it 'renders a 302 status code' do
        get :show
        expect(response.status).to eq 302
      end
      it 'redirects to login url' do
        get :show
        expect(response).to redirect_to(login_path)
      end
    end
  end

end
