module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) 
    else
      deny_acces
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session[:user_id] = nil
    self.current_user = nil
  end

  def current_user?(user)
    user == current_user
  end

  def deny_acces
    redirect_to '/login', flash[:notice] = "Please sign in to access this page"
  end
end