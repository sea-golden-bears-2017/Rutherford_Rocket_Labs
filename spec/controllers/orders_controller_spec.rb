require 'rails_helper'

describe OrdersController, type: :controller do
  describe 'orders#new' do
    before(:each) do
      get :new
    end
    it 'responds with a 200 status code'
    it 'renders a new orders template'
  end
end
