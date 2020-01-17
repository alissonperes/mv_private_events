# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) do
    User.create!(name: 'Foobar', email: 'foobar@bar.com',
                 password: 'foobar', password_confirmation: 'foobar')
  end

  subject do
    user.events.create!(name: 'Anything', description: 'Anything',
                        location: 'Anywhere', scheduled: Time.now + 1.month)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'a user can have more than one event' do
    event1 = user.events.create!(name: 'Anything', description: 'Anything',
                                 location: 'Anywhere', scheduled: Time.now + 1.month)
    event2 = user.events.create!(name: 'Anything2', description: 'Anything2',
                                 location: 'Anywhere2', scheduled: Time.now + 2.month)

    expect(user.reload.events).to eq([event1, event2])
  end

  it 'is not valid without a description' do
    subject.description = ''
    expect(subject).to_not be_valid
  end

  it 'is not valid without an user id' do
    subject.creator_id = nil
    expect(subject).to_not be_valid
  end
end
