require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:user) { create(:user) }

  describe "#current_user" do

    context "with user logged in" do

      it "returns the current user with the right user id" do
        session[:user_id] = user.id
        expect(subject.current_user).to eq user
      end

      it "returns nil with the wrong user id" do
        session[:user_id] = 232354
        expect(subject.current_user).to be_nil
      end

    end

    context "with a user not logged in" do
      it "returns nil" do
        expect(subject.current_user).to be_nil
      end
    end

  end
end
