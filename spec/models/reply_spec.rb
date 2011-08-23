require 'spec_helper'

describe Reply do
  it { should belong_to(:event) }
  it { should belong_to(:user) }
  
  before do
    @reply = Reply.new
  end
  
  it 'should be invalid without a user and event' do
    @reply.should_not be_valid
    @reply.event_id = 1
    @reply.user_id = 2
    @reply.should be_valid
  end

end

# == Schema Information
#
# Table name: replies
#
#  id         :integer(4)      not null, primary key
#  answer     :string(255)
#  note       :string(255)
#  event_id   :integer(4)      not null
#  user_id    :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

