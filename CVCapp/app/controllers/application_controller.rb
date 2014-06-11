class ApplicationController < ActionController::Base
	before_filter :configure_permitted_parameters, if: :devise_controller?
	before_action :set_session_vars

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :password_confirmation) } 
    end

    def set_session_vars
    	if (not session[:acct_id]) && user_signed_in?
    		if (current_user.account_id >= 0)
    			session[:acct_id] = current_user.account_id
    		else
    			session[:acct_id] = -1
    		end
    		puts "SETTING session var: acct_id"
    	end
    end
end
