class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', dependent: :destroy
  has_secure_password
end
