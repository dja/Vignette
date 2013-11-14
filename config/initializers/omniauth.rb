Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           :scope => 'email,image,first_name,last_name,user_birthday,username,user_location,link', image_size: 'large'
end