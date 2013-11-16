class User < ActiveRecord::Base

	def self.from_omniauth(auth)
	    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	      user.provider = auth.provider
	      user.uid = auth.uid
	      user.email = auth.info.email
	      user.name = auth.info.name
	      user.first_name = auth.info.first_name
	      user.last_name = auth.info.last_name
	      user.image = auth.info.image
	      user.link = auth.extra.raw_info.link
	      user.username = auth.extra.raw_info.username
	      if user.user_location == nil
	      	user.user_location = auth.info.location
	      end
	      user.oauth_token = auth.credentials.token
	      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	      user.save!
	    end
  	end
end
