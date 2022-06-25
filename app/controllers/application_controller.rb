class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:password, :email) }
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
        # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
    end
    def logged_in?
        !current_user.nil?
    end

    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to login_url 
        end	
    end
end
