#Omniauth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '383433138417885', '7542fb4223dfd9311309bc7a25b47e95'
end
