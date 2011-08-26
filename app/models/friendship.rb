class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
end

# == Schema Information
#
# Table name: friendships
#
#  user_id    :integer(4)
#  friend_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

