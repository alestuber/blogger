require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "authentication/hashing" do
    it { should have_secure_password }
  end


  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_length_of(:password).is_at_least(8) }
  end

end
