class UserMailer < ApplicationMailer

  def welcome_email
    @user = params[:user]
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Fakebook')
  end
end
