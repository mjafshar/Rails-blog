class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: {with: /^(\w+[\-\.])*\w+@(\w+\.)+[A-Za-z]+$/}

  has_many :posts, dependent: :destroy
  has_many :comments
end
