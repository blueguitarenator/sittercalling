class Invitation < ActiveRecord::Base
  belongs_to :user
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
            :format   => { :with => email_regex }

end

# == Schema Information
#
# Table name: invitations
#
#  id         :integer(4)      not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer(4)
#

