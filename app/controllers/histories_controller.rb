class HistoriesController < ApplicationController
  
  # GET /histories
  # GET /histories.xml
  def index
    @user = current_user
    @historic_events = @user.events.historic_sorted
    @historic_replies = @user.replies.historic_sorted

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @histories }
    end
  end

end