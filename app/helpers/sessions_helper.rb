module SessionsHelper
  def sign_in(user, persistence)
  	if persistence
    	cookies.permanent[:remember_token] = user.remember_token
    else
    	session[:remember_token] = user.remember_token
    end
    self.current_user = user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
    session.delete(:remember_token)
    session.delete(:persistence)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    session[:persistence] = !User.find_by_remember_token(cookies[:remember_token]).nil?
    @current_user ||= User.find_by_remember_token(cookies[:remember_token]) || User.find_by_remember_token(session[:remember_token])
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def power_level?(level)
    if current_user
      current_user.power_level >= level
    else
      0 >= level
    end
  end
  
  def own_topic?(topic)
    topic.user == current_user
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
