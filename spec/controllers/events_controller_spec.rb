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

  # EDIT
  describe "GET events/:id/edit" do
    
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
        get :edit, :id => "1", :event => {}
      end
      
      it "should render the event's edit page" do
        @rich.events.should_receive(:find).with("1").and_return(@event)
        get :edit, :id => "1", :event => {}
        response.should render_template('edit')
      end
    end      
  end
  
  # NEW
  describe "GET events/new" do
   describe "with valid params" do
  
      before(:each) do
        @event = mock_model(Event)
      end      
      
      it "should create new event" do
        Event.should_receive(:new)
        get :new, :event => {}
      end
      
      it "should render the event new page" do
        get :new, :event => {}
        response.should render_template('new')
      end
    end
  end
  
  # CREATE
  describe "POST events/create" do
    let (:evt) { mock_model(Event)}
    let(:params) { {:event => evt} }
    describe "with valid params" do
      before(:each) do
        @rich = Factory.build(:rich)
        #@event = mock_model(Event)
        controller.stub(:current_user).and_return{@rich}
      end      
      
      it "should create new event" do
        Event.should_receive(:new).with(evt).and_return{evt} 
        post 'create', params
        # @rich.events.count.should == 1
      end
      
      it "should render the event new page" do
        Event.should_receive(:new).with(evt).and_return{evt} 
        post 'create', params
        response.should redirect_to(event_url(evt))
      end
    end
  end

  # SHOW
  describe "get Show" do
    before(:each) do
      @rich = Factory.build(:rich)
      controller.stub(:current_user).and_return{@rich}
      # @event = mock_model(Event, :update_attributes => true)
      # @events = mock_model(Event);
      # @rich.stub!(:events).and_return(@event)
      Event.stub!(:find).with("1").and_return(@event)
    end      
    
    it "should set current user" do
      get :show, :id => "1", :event => {}
      assigns(:user).should == @rich
    end
    
    it "should find event and return object" do
      Event.should_receive(:find).with("1").and_return(@event)
      get :show, :id => "1", :event => {}
    end
    
    it "should render the event's show page" do
      get :show, :id => "1", :event => {}
      response.should render_template('show')
    end
  end      
end
