require 'spec_helper'

# == Schema Information
#
# Table name: events
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  event_date :date            not null
#  start_time :string(255)     default(""), not null
#  end_time   :string(255)     default(""), not null
#  note       :string(255)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#
describe Event do
  it { should belong_to(:user) }
  it { should have_many(:replies) }
  
  before(:each) do
    @attr = {:event_date => Time.now, :start_time => "5pm", :end_time => "11pm"}
  end
  
  it "should create a new instance given valid attributes" do
    Event.create!(@attr)
  end
    
  it "should require an event date" do
    no_date_event = Event.new(@attr.merge(:event_date => ""))
    no_date_event.should_not be_valid
  end
    
  it "should require an event start time" do
    no_start_time_event = Event.new(@attr.merge(:start_time => ""))
    no_start_time_event.should_not be_valid
  end
    
  it "should require an event end time" do
    no_end_time_event = Event.new(@attr.merge(:end_time => ""))
    no_end_time_event.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_event = Event.new(@attr.merge(:name => long_name))
    long_name_event.should_not be_valid
  end
end

describe 'historic events' do
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


