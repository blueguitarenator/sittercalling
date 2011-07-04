class User < ActiveRecord::Base
  acts_as_authentic
  
  has_and_belongs_to_many :friends,
                          :class_name => "User",
                          :join_table => "users_friends",
                          :foreign_key => "user_id",
                          :association_foreign_key => "friend_id",
                          :after_add => :create_reverse_association,
                          :after_remove => :remove_reverse_association
  
  attr_accessible :first_name, :last_name, :email
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :first_name, :last_name,  :presence => true,
                                      :length   => { :maximum => 50 }
                                                  
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }

private
  def create_reverse_association(associated_user)
    associated_user.known_friends << self unless associated_user.known_friends.include?(self)
  end
  def remove_reverse_association(associated_user)
    associated_user.known_friends.delete(self) if associated_user.known_friends.include?(self)
  end
end


# == Schema Information
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  first_name          :string(255)     not null
#  last_name           :string(255)     not null
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

