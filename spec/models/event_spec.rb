require 'spec_helper'

describe Event do
  it { should belong_to(:user) }
  it { should have_many(:replies) }
  # it { should validate_presence_of(:event_date) }
  # it { should validate_presence_of(:start_time) }
  # it { should validate_presence_of(:end_time) }

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

describe 'historic events' do
  before do
    #@rich << Factory(:user_with_event)
    # @rich = Factory.build(:rich)
    # @rich.events << Event.new(:name => "Dinner", :event_date => 1.day.ago, :start_time => "6pm", :end_time => "10pm", :note => "thanks")
    # @rich.events << Event.new(:name => "Dinner", :event_date => 2.day.ago, :start_time => "6pm", :end_time => "10pm", :note => "thanks")
    # @rich.save
    # puts @rich.valid?
    # puts @rich.errors.inspect
    # Event.all.each{|x| puts x.id}
    
    # @rich = Factory(:user_with_historic_events)
    
    # @old_events << Event.new
    # @old_events << Event.new
    # @old_events << Event.new

    # [ 1.hour.ago, 5.minutes.ago, 1.minute.ago ].each_with_index do |time, index|
      # event = @old_events[index]
      # event.created_at = time
      # event.save
    # end
  end

  it 'historic should be ordered descending' do
    rich = Factory(:user_with_historic_events)
    historic = rich.events.historic_sorted
    historic.first.event_date.should > historic.last.event_date
  end

  it 'upcoming should be ordered ascending' do
    rich = Factory(:user_with_upcoming_events)
    upcoming = rich.events.upcoming_sorted
    upcoming.first.event_date.should < upcoming.last.event_date
  end
end
