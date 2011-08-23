require 'spec_helper'

class EventTest < ActiveSupport::TestCase

 # MOVED TO SPEC

end
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

