class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session #reset user id for security
      log_in users
      redirect_to user
    else
      flash.now[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end

end
