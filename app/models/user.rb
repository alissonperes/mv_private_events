class User < ApplicationRecord
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :events, foreign_key: 'creator_id', dependent: :destroy
  has_many :attendees, through: :attendances
  has_many :attended_events, through: :attendances
  has_secure_password
end
