Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['client_ID'], ENV['client_SECRET'], scope: "user, gists"
end