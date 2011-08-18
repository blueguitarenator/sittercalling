class Reply < ActiveRecord::Base
  
  # named_scope :historic, lambda { |date| { 
                # :joins => :event, 
                # :order => 'eventDate DESC', 
                # :conditions => ['eventDate < ?', date]}}
#                 
  # named_scope :upcoming, lambda { |date| { 
                # :joins => :event, 
                # :order => 'eventDate ASC', 
                # :conditions => ['eventDate >= ?', date]}}
             
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
