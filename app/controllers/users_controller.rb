class UsersController < ApplicationController
  before_action :signed_in_user,        only:   [:index, :edit, :update, :destroy]
  before_action :correct_user,  only:   [:edit, :update]
  before_action :admin_user,    only:   :destroy
  
  def show
    @user = User.find(params[:id])
    @user_all = all_users(@user.name)
    @microposts = @user.microposts.paginate(page: params[:page])
  end
   
  def index
    @titre = "All users"
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
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

  def edit
    @titre = "Edit user"
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    @user.admin = true
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App " + @user.name + "!"
      redirect_to @user
    else
      render 'new'
    end
  end
    
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
