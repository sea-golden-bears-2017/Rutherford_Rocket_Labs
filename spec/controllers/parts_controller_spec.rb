require 'rails_helper'

RSpec.describe PartsController, type: :controller do

context "GET parts#index" do
  it "responds with status code 302 if logged_in? is false" do
    get :index
    expect(response.status).to eq 302
  end
end


end
