require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @event = Event.new(name: 'test event', description: 'test event',
                       location: 'test event', scheduled: Time.now + 2.hours,
                       creator: users(:user1))
  end

  test 'event should be valid' do
    assert @event.valid?
  end

  test 'should have a description' do
    @event.description = '   '
    assert_not @event.valid?
  end
end
