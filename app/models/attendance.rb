class Attendance < ApplicationRecord
  belongs_to :attended_event, class_name: :Event, foreign_key: :event_id
  belongs_to :attendee, class_name: :User
  validates :event_id, presence: true
  validates :attendee_id, presence: true
end
