class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_username(params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      persistence = params[:session][:stay_logged]
      sign_in user, persistence
      redirect_back_or root_path
  	else
      flash[:error] = 'Invalid username/password combination'
      redirect_to login_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
