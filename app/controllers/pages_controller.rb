class PagesController < ApplicationController
  def home
    if current_user
      redirect_to(current_user)
    end
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
end
