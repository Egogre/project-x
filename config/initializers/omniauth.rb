OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, 'ee59ac70ceb04f2c90fb103d3f0ac969', '06ea4da5140e4a3e9ae1524d5f047ba4'
end
