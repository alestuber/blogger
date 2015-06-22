require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:user) { create(:user) }

      it "create a session" do
        post :create, session: { email: user.email, password: 'password' }
        expect(session[:user_id]).to eq user.id
      end

      it "redirects to the new action again" do
        post :create, session: { email: user.email, password: 'password' }
        expect(response).to redirect_to :login
      end
    end

    context "with invalid attributes" do
      let(:user) { create(:user) }

      it "create a session" do
        post :create, session: { email: user.email, password: 'wrongpassword' }
        expect(session[:user_id]).to be_nil
      end

      it "re-renders the new view" do
        post :create, session: { email: user.email, password: 'wrongpassword' }
        expect(response).to render_template :new
      end
    end
  end

end
