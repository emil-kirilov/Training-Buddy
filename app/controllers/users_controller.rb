class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      UserMailer.welcome_mail(@user).deliver_later
      flash[:notice] = "User created successfully."
      render :show
    else
      flash[:error] = "Some error occured. The user was not creted."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end