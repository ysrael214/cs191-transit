module SessionsHelper

  # Most of these functions are supposed to be used in controllers. Should only use these functions when manipulating the current logged in user.

  # session variable is now populated with the corresponding entry.
  def log_in(commuter)
    session[:commuter_id] = commuter.id
  end

  # Returns the current user, if he/she is logged-in.
  def current_user
    if session[:commuter_id]
      if @commuter.nil?
        @commuter = Commuter.find_by(id: session[:commuter_id])
      else
        @commuter
      end
    end
  end

  # Returns whether user is logged in or not. Exclamation mark to force it as a boolean value.
  def logged_in?
    !current_user.nil?
  end

  # Logs out user by deleting his entry in the session variable.
  def log_out
    session.delete(:commuter_id)
    @current_user.nil?
  end
end
