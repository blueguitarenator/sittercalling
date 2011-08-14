require 'spec_helper'

class EventTest < ActiveSupport::TestCase

  describe Event do
    before do
      @event = Event.new
    end
    
    it 'should be invalid without a user date start_time end_time user_id' do
      @event.should_not be_valid
      @event.event_date = Time.now
      @event.start_time = "5am"
      @event.end_time = "7am"
      @event.user_id = 1
      @event.should be_valid
    end 
  end

end