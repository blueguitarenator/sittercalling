
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

class Event < ActiveRecord::Base  
  scope :historic, lambda {
    where (["event_date < ?", Time.zone.now]) 
  }
    
  scope :upcoming, lambda {
    where (["event_date >= ?", Time.zone.now])
  }
  
  scope :historic_sorted, historic.order("event_date desc")  
  scope :upcoming_sorted, upcoming.order("event_date asc")  
  
  belongs_to :user
  has_many :replies, :dependent => :destroy
  validates_presence_of :event_date, :message => 'is required'
  validates_presence_of :start_time, :message => 'is required'
  validates_presence_of :end_time, :message => 'is required'
  
  @sitter_name
  
  def sitter_name(status)
    replies.each do |r|
      if (r.answer.downcase == status.downcase)
        @sitter_name = r.user.first_name + " " + r.user.last_name
      end
    end
    @sitter_name
  end
  
  def covered
    replies.each do |r|
      if (r.answer.downcase == 'yes')
        return true
      end
    end
    return false
  end
  
  def pending
    replies.each do |r|
      if (r.answer.downcase == '<none>')
        return true
      end
    end
    return false
  end
  
  def event_date_formatted
     event_date.strftime '%Y-%m-%d'
  end

end
