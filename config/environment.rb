# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'app85931423@heroku.com',
  :password => '3q2tmkvr3861',
  :domain => 'https://sleepy-shelf-21352.herokuapp.com/',
#   blocipedia-emilypbrown.c9users.io ?
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}