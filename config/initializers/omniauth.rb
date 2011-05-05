require 'omniauth/enterprise'

cas_server = Rails.env == 'production' ? 'https://authentification-cerbere.application.i2/cas/' : 'http://localhost:9292'
Rails.application.config.middleware.use OmniAuth::Strategies::CAS, :cas_server => cas_server

OmniAuth.config.full_host = Proc.new do |env|
  url = env["rack.session"]["omniauth.origin"] || env["omniauth.origin"] 
  url.gsub(%r{/$})
end
