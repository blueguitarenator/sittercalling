class ResetPasswordController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
 

  def new
    render
  end

  def create
    @user = User.find_by_email(params[:reset_password][:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you. " +
      "Please check your email."
      redirect_to :root
    else
      flash[:notice] = "No user was found with that email address"
      render :action => :new
    end
  end
 
  def edit
    render
  end

  def update
    if @user.update_attributes(params[:user])
      puts "SAVED"
      flash[:notice] = "Password successfully updated"
      redirect_to :root
    else
      puts "SHIT"
      flash[:notice] = "Unable to update password."
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
      redirect_to :root

    end
  end
end