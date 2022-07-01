# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.smtp_settings = {
#     :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
#     :password => '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', # This is the secret sendgrid API key which was issued during API key creation
#     :domain => 'yourdomain.com',
#     :address => 'smtp.sendgrid.net',
#     :port => 587,
#     :authentication => :plain,
#     :enable_starttls_auto => true
#   }