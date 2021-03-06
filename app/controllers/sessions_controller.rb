class SessionsController < ApplicationController
  before_action :robbie?

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to posts_dashboard_path
    else
      flash.now[:error] = "Invalid Credentials"
      render :new
    end
  end

  def robbie?
    if current_user
      redirect_to posts_dashboard_path
    end
  end

end
