class User < ActiveRecord::Base

	def self.from_omniauth(auth)
	    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	    	if User.find_by_email(auth.info.email) == nil # Remove these ifs after beta period
	    		return 'closed'
	    	else
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


  	# validates :invitation_id, presence: true, uniqueness: true

	has_many :sent_invitations, class_name: 'Invitation', foreign_key: 'sender_id'
	belongs_to :invitation

	before_create :set_invitation_limit

	def invitation_token
	  invitation.token if invitation
	end

	def invitation_token=(token)
	  self.invitation = Invitation.find_by_token(token)
	end

	private

	def set_invitation_limit
	  self.invitation_limit = 5
	end
end
