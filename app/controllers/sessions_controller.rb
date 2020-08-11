class SessionsController < ApplicationController
  def new
  end
  
  def create
    #find user by email
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      forwarding_url = session[:forwarding_url] #stored session
      reset_session #reset user id for security
      log_in user
      redirect_to forwarding_url || user
    else
      flash.now[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end

  #destroys session
  def destroy
    log_out
    redirect_to root_url
  end

end
