class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @titre = "Sign up"
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
  end
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
