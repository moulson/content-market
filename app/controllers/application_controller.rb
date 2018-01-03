class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :redirect_subdomain

	def redirect_subdomain
	  if request.host == 'content-market.co.uk'
	    redirect_to 'www.puppies.com' + request.fullpath, :status => 301
	  end
	end
	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def authorize
		redirect_to root_path, alert: "Not authorized" unless current_user.email == "dan24797@gmail.com" || current_user.email == "cmadmin"
	end
end
