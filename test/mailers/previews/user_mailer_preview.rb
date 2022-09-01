# Preview all emails at http://localhost:3001/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def welcome_email
        @user = User.last
        UserMailer.with(user: @user).welcome_email.deliver_now
    end
end
