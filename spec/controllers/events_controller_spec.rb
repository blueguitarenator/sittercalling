require 'spec_helper'

describe EventsController do

  # UPDATE
  describe "PUT events/:id" do
    
    describe "with valid params" do
  
      before(:each) do
        @rich = Factory.build(:rich)
        controller.stub(:current_user).and_return{@rich}
        @event = mock_model(Event, :update_attributes => true)
        @events = mock_model(Event);
        @rich.stub!(:events).and_return(@event)
        Event.stub!(:find).with("1").and_return(@event)
      end      
      
      it "should find event and return object" do
        @rich.events.should_receive(:find).with("1").and_return(@event)
        put :update, :id => "1", :event => {}
      end
      
      it "should update the event object's attributes" do
        @rich.events.should_receive(:find).with("1").and_return(@event)
        put :update, :id => "1", :event => {}
      end
            
      it "should redirect to the event's show page" do
        @rich.events.should_receive(:find).with("1").and_return(@event)
        put :update, :id => "1", :event => {}
        response.should redirect_to(event_url(@event))
      end
    end
      
    describe "with invalid params" do
  
      before(:each) do
        @rich = Factory.build(:rich)
        controller.stub(:current_user).and_return{@rich}
        @event = mock_model(Event, :update_attributes => false)
        @events = mock_model(Event);
        @rich.stub!(:events).and_return(@event)
        Event.stub!(:find).with("1").and_return(@event)
      end      
      
      it "should find event and return object" do
        @rich.events.should_receive(:find).with("1").and_return(@event)
        put :update, :id => "1", :event => {}
      end
      
      it "should update the event object's attributes" do
        @rich.events.should_receive(:find).with("1").and_return(@event)
        put :update, :id => "1", :event => {}
      end
            
      it "should redirect to the event's edit page" do
        @rich.events.should_receive(:find).with("1").and_return(@event)
        put :update, :id => "1", :event => {}
        response.should render_template('edit')
      end
    end
  end
  
  describe "GET events/new" do
    
    
    
  end

  # context "get Show" do
    # before do
      # @rich = Factory.build(:rich)
    # end
#     
    # def do_show
      # get :show, id => @rich
    # end
#     
    # it "should assign current user" do
      # controller.stub(:current_user).and_return{@rich}
      # do_show
      # assigns[:user].email.should == @rich.email
    # end
  # end
end
