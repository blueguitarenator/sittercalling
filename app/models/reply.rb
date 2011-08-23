
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

class Reply < ActiveRecord::Base
             
  scope :historic, lambda {
    joins(:event).
    where (["event_date < ?", Time.zone.now]) 
  }
  scope :upcoming, lambda {
    joins(:event).
    where (["event_date >= ?", Time.zone.now])
  }
  
  scope :historic_sorted, historic.order("event_date desc")  
  scope :upcoming_sorted, upcoming.order("event_date asc")  
   
  belongs_to :user
  belongs_to :event
  
  validates_presence_of :user_id, :message => 'is required'
  validates_presence_of :event_id, :message => 'is required'

end
