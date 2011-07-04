class UserSession < Authlogic::Session::Base
  authenticate_with User
  
  # 'Model_name' error fix info
  # http://groups.google.com/group/mongomapper/browse_thread/thread/2a247f17a5d06dda
  def model_name 
       @_model_name ||= ActiveModel::Name.new(self) 
  end
end