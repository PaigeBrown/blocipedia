Rails.configuration.stripe = {
   publishable_key: 'STRIPE_PUBLISHABLE_KEYs',
   secret_key: ENV['STRIPE_SECRET_KEY']
 }
 
 Stripe.publishable_key = Rails.configuration.stripe[:publishable_key]
 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]




# Store the environment variables on the Rails.configuration object
#  Rails.configuration.stripe = {
#   publishable_key: 'pk_test_ro9jV5SNwGb1yYlQfzG17LHK',
#   # publishable_key: ENV['STRIPE_PUBLISHABLE_KEY']
#   secret_key: ENV['STRIPE_SECRET_KEY']
#  }
 
#  # Set our app-stored secret key with Stripe
#  Stripe.api_key = Rails.configuration.stripe[:secret_key]