# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

config.action_mailer.default_url_options = { :host => 'https://blocipedia-emilypbrown.c9users.io/' }

ActionMailer::Base.smtp_settings = {
  :user_name => 'app85931423@heroku.com',
  :password => '3q2tmkvr3861',
  :domain => 'yourdomain.com',
#   blocipedia-emilypbrown.c9users.io ?
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}