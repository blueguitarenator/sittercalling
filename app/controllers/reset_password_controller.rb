class ResetPasswordController < ApplicationController
  before_filter :require_no_user, :only => [:edit, :update]
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  def edit
    render
  end

  # POST /reset_password
  # POST /reset_password
  def create
    @user = User.find_by_email(params[:reset_password][:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you. " +
      "Please check your email."
      redirect_to :logout
    else
      flash[:notice] = "No user was found with that email address"
      render :action => :new
    end
  end

  # GET /reset_password/new
  # GET /reset_password/new.xml
  def new
    render
  end

  def update
    @user.password = params[:reset_password][:password]
    @user.password_confirmation = params[:reset_password][:password_confirmation]
    if @user.save
      flash[:notice] = "Password successfully updated"
      redirect_to user_path(@user)
    else
      render :action => :edit
    end
  end

  private

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:notice] = "We're sorry, but we could not locate your account. " +
      "If you are having issues try copying and pasting the URL " +
      "from your email into your browser or restarting the " +
      "reset password process."
      redirect_to login_path

    end
  end
end