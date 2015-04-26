if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key      => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_V9wJmWF4Hmw2CdZmrH8u8lMY',
    :secret_key      => 'sk_test_RxVPF3XxQKVbhm6c5KxqAES6'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]