require 'rails_helper'

describe OrdersController, type: :controller do
  describe 'orders#new' do
    before(:each) do
      get :new
    end
    it 'responds with a 200 status code' do
      expect(response.status).to eq 200
    end
    it 'renders a new orders template' do
      expect(response).to render_template(:new)
    end
  end
end
