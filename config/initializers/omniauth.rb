Rails.application.config.middleware.use OmniAuth::Builder do
  provider :pocket, Settings.consumer_key
end
