OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '575279945976748', 'f24ee537292d951c1a0cf3bd3f5573a7'
end