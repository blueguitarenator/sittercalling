class EventsController < ApplicationController


  # GET /events/1
  # GET /events/1.xml
  def show
    @user = current_user
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @user = current_user
    @event = current_user.events.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    if (current_user.events << @event)
      redirect_to event_url(@event)
    else
      render :action => :new
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @user = current_user
    @event = current_user.events.find(params[:id])
    if (@event.update_attributes(params[:event]))
      redirect_to event_url(@event) #user_url(current_user)
    else
      render :action => :edit
    end
  end
end