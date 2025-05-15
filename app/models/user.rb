class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    has_many :friends
  has_one_attached :avatar

end