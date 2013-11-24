class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


helper_method :current_user

private

def current_user
	user ||= User.find(session[:user_id]) if session[:user_id]
	if user && user.type == "Photographer"
		@current_user ||= Photographer.find(session[:user_id])
	elsif user && user.type == "Customer"
		@current_user ||= Customer.find(session[:user_id])
	end
end

end
