Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'],
           scope: 'email, user_location', image_size: 'large', info_fields: 'name, first_name, last_name, user_location, image'
end