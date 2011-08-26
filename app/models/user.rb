

# == Schema Information
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  first_name          :string(255)     default(""), not null
#  last_name           :string(255)     default(""), not null
#  email               :string(255)     not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  login_count         :integer(4)      default(0), not null
#  failed_login_count  :integer(4)      default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#

class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :friendships
  has_many :friends, :through => :friendships
#  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
#  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  
  has_many :events, :dependent => :destroy
  has_many :replies, :dependent => :destroy
  has_many :invitations, :dependent => :destroy

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :first_name, :last_name,  :presence => true,
                                      :length   => { :maximum => 50 }
                                                  
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  
  def self.like(params)
      if params.include?('@')
        conditions = {:email => params}
      else
        conditions = ['last_name like ?', params]
      end  
    User.all(:conditions => conditions)
  end
  
  def event_histories
    self.events
  end
  
  def reply_histories
    self.replies
  end
  
  def full_name
    name = first_name + " " + last_name
  end
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    BabysitMailer.deliver_password_reset_instructions(self)  
  end
end

