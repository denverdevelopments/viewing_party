class UsersController < ApplicationController 

  def new
    @user = User.new
  end

  def create
    user = user_params 
    user[:email] = user[:email].downcase 
    new_user = User.create(user)
    if new_user.save 
      redirect_to dashboard_path
      flash[:success] = "Welcome, #{new_user[:email]}!"
    else
      flash[:error] = "Passwords do not match"
      redirect_to registration_path
    end
  end

  def show 

  end

  private
    def user_params 
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
