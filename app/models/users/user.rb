class User < ActiveRecord::Base


	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth['provider']
			user.uid = auth['uid']
			if auth['info']
				user.name = auth['info']['email'] || ""
				user.name = auth['info']['image'] || ""
				user.name = auth['info']['first_name'] || ""
				user.name = auth['info']['last_name'] || ""
				user.name = auth['info']['user_birthday'] || ""
				user.name = auth['info']['username'] || ""
				user.name = auth['info']['user_location'] || ""
				user.name = auth['info']['link'] || ""
			end
		end
	end
end
