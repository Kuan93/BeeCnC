OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, '521990168011585', 'eac3f2c0968d82a0912fbe9aadb5c173'
    end