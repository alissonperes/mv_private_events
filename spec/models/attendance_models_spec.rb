# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  let(:user) { User.create!(name: 'Foobar', email: 'foobar@bar.com',
                            password: 'foobar', password_confirmation: 'foobar') }
  let(:user2) { User.create!(name: 'Foobar2', email: 'foobar2@bar.com',
                            password: 'foobax', password_confirmation: 'foobax') }
  let(:event) do
    user.events.create!(name: 'Anything', description: 'Anything',
                        location: 'Anywhere', scheduled: Time.now + 1.month)
  end

  subject { Attendance.new  }

  it 'is valid with valid attributes' do
    subject.event_id = event.id
    subject.attendee_id = user.id
    expect(subject).to be_valid
  end

  it 'is not valid without user' do
    subject.event_id = event.id
    subject.attendee_id = ''
    expect(subject).to_not be_valid
  end

  it 'is not valid without event' do
    subject.event_id = ''
    subject.attendee_id = user.id
    expect(subject).to_not be_valid
  end
end
