class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.first_name} #{user.last_name}!"
      redirect_to root_path
    else
      flash.now[:error] = "Unable to login with this email and password combination."
      render :new
    end
  end
end
