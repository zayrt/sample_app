class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_all = all_users(@user.name)
  end
   
  def all_users(current_user)
    i = 1
    i2 = 0
    @all_users = Array.new
    nb_users = User.count + 1
    while (i < nb_users)
      if current_user !=  User.find(i).name
        @all_users[i2] = User.find(i).name
        i2 += 1
      end
      i += 1
    end
    return @all_users
  end

  def new
    @titre = "Sign up"
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
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
