class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    flash[:email] = @user.email
    
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.error.full_messages
      render :new
    end
  end

  def show
    render :show
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
