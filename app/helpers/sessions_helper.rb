module SessionsHelper
  def current_user
    if session[:user_id]
      @current_user ||= User.find session[:user_id]
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
