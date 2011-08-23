class Invitation < ActiveRecord::Base
  belongs_to :user
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

