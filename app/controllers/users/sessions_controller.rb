# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def create
    super
    # if devise_mapping.omniauthable? 
    #   user = User.from_omniauth(request.env["omniauth.auth"])
    #   session[:user_id] = user.id
    #   redirect_to root_url
    # end
  end

  # def destroy
  #   super
  # end
end
