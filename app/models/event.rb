class Event < ApplicationRecord
  has_many :attendances
  belongs_to :creator, class_name: :User
  has_many :attendees, class_name: :User, through: :attendances
  validates :description, presence: true

  scope :upcoming, -> { where("scheduled >= date('now')") }
  scope :previous, -> { where("scheduled <  date('now')") }
end
