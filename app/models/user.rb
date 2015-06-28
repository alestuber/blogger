class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 8 }, allow_blank: true
  has_secure_password
  before_create :create_remember_token


  private
    def create_remember_token
      self.remember_token = Digest::SHA1.hexdigest SecureRandom.urlsafe_base64
    end
end
