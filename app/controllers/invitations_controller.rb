class InvitationsController < ApplicationController

	def new
	  @invitation = Invitation.new
	end

	def create
	  @invitation = Invitation.new(invitation_params)
	  @invitation.sender = current_user
	  if @invitation.save
	    if current_user
	      Mailer.deliver_invitation(@invitation, signup_url(@invitation.token))
	      flash[:notice] = "Thank you, invitation sent."
	      redirect_to root_url
	    else
	      flash[:notice] = "Thank you, we will notify when we are ready."
	      redirect_to root_url
	    end
	  else
	    render action: 'new'
	  end
	end


	private

	def invitation_params
		params.require(:invitation).permit(:recipient_email)
	end
end
