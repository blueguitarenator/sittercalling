class Event < ActiveRecord::Base
  # named_scope :historic, lambda {|date| {
    # :order => 'eventDate DESC', 
    # :conditions => ["eventDate < ?", date]}}
      
      
  # named_scope :upcoming, lambda {|date| {
    # :order => 'eventDate ASC', 
    # :conditions => ["eventDate >= ?", date]}}
  
   scope :historic, lambda {
     |date| where (["event_date < ?", date]) 
   }
   
   scope :desc, lambda {
     where ("event_date DESC")
   }
   
   scope :asc, lambda {
     where ("event_date ASC")
   }
   
  scope :upcoming, lambda {
    |date| where (["event_date >= ?", date])
  }
  
  belongs_to :user
  has_many :replies, :dependent => :destroy
  validates_presence_of :event_date, :message => 'is required'
  validates_presence_of :start_time, :message => 'is required'
  validates_presence_of :end_time, :message => 'is required'
  
  @sitter_name
  
  def sitter_name(status)
    # replies.each do |r|
      # if (r.answer.downcase == status.downcase)
        # @sitter_name = r.user.first_name + " " + r.user.last_name
      # end
    # end
    @sitter_name
  end
  
  def covered
    # replies.each do |r|
      # if (r.answer.downcase == 'yes')
        # return true
      # end
    # end
    return false
  end
  
  def pending
    # replies.each do |r|
      # if (r.answer.downcase == '<none>')
        # return true
      # end
    # end
    return false
  end
  
  def event_date_formatted
     event_date.strftime '%Y-%m-%d'
  end

end
