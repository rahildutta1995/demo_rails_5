class SessionsController < ApplicationController
  def new
  
  end
  
  def create
    @user = User.find_by(email: params[:sessions][:email].downcase)
    if @user && @user.authenticate(params[:sessions][:password])
      log_in @user
      params[:sessions][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to @user
      flash[:notice] = "Login Successfull!"
    else
      flash[:alert] = "Invalid email/password!"
      render 'new'
    end
  end
  def destroy
    logout if logged_in?
    redirect_to root_url
  end

end
