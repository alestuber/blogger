require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "#create" do
  #   context "with valid credentials" do
  #     let :credentials do
  #       { :email => 'example@gmail.com', :password => 'secret' }
  #     end

  #     let :user do
  #       FactoryGirl.create(:user, credentials)
  #     end
  #   end
  # end

end
