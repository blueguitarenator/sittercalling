
require 'spec_helper'

class UserTest < ActiveSupport::TestCase
  
  describe User do
    before(:each) do  
      @attr = {  
      :password => "asdf",  
      :password_confirmation => "asdf"
      }

    end
 
    it "can be instantiated" do
      User.new.should be_an_instance_of(User)
    end
    
    it "should associate friends" do
      rich = Factory(:rich)
      amanda = Factory(:amanda)
      @rich.friends << @amanda
      @rich.friends.size.should == 1
      @amanda.friends.size.should == 1
      @rich.friends.first.should == @amanda
      @amanda.friends.first.should == @rich
    end
  end
  
  # def test_should_load_babysitter_attributes
    # amanda = Factory(:amanda)
    # assert_equal("Amanda", amanda.first_name)
    # assert_equal("Barker", amanda.last_name)
    # assert_equal("amanda@msn.com", amanda.email)
    # assert_equal("babysitter", amanda.acct_type)
  # end
  
end