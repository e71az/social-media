require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET /" do


    context "from login user" do
      it "should return 200:OK" do
        login_user

        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end