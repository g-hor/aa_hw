class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email], params[:user][:password]
      )
      
    if @user
      flash[:email] = @user.email
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Nice try, but we couldn't find a match with those credentials :^("]
      redirect_to new_session_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  
end
