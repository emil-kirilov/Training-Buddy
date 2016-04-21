class SessionsController < ApplicationController
  def new
  end

  def create  
    @user = User.find_by(email: params[:session][:email])
    if @user and @user.authenticate(params[:session][:password])
      sign_in @user
      redirect_to @user, notice: "Successfully logged in"
    else
      flash.now[:error] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    sign_out
    flash.now[:notice] = "Successfully logged out"
    render :new 
  end
end