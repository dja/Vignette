class PhotographersController < ApplicationController
	before_action :set_photographer, only: [:show, :edit, :update, :destroy]
	respond_to :html

	def new
		session[:user_type] = "Photographer"
	end

	def create
		redirect_to customers_url
	end

	def show
		respond_with(@photographer)
	end

	def edit
	end

	def update
		respond_with(@photographer)
	end

	def destroy
		@photographer.destroy
		respond_with(@photographer)
	end


	private

	def set_photographer
		@photographer = Photographer.find(params[:id])
	end

	def photographer_params
		params.require(:photographer).permit(:name,
											:first_name,
											:last_name,
											:email,
											:user_birthday,
											:username,
											:link,
											:image,
											:user_location,
											:latitude,
											:longitude,
											:photographer_location,
											:rating,
											:radius,
											:camera,
											:bio,
											:fact,
											:available,
											:uid,
											:provider,
											:oauth_token,
											:oauth_expires_at)
	end
end
