class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 8 }, allow_blank: true
  has_secure_password
end
