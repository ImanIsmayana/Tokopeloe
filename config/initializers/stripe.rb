Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_ZB0qmjwuJuMmVLjCkp6SZtFp'],
  :secret_key      => ENV['sk_test_TCGazlBsoFzKyCeZLuVWHGPj']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
