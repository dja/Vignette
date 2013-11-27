class PhotographersController < ApplicationController
	before_action :set_photographer, only: [:show, :edit, :update, :destroy]
	respond_to :html

	def new
	end

	def create
		redirect_to photographers_url
	end

	def show
		@reservations = Reservation.find(:all, conditions: { photographer_id: nil })
		respond_with(@photographer, @reservations)
	end

	def changeavailable
		available = params[:available]
		if available == true
			current_user.available = false
		elsif available == false
			current_user.available = true
		end
		if current_user.save!
			render status: :ok, json: { status: 'SUCCESS', available: available }
		else
			render status: 422, json: { status: 'FAILED' }
		end
	end

	def accept
		accept_id = params[:accept]
		lat = accept_id.split(/,/)[0]
		lng = accept_id.split(/,/)[1]
		id = accept_id.split(/,/)[2]
		reservation = Reservation.find_by_id(id)
		reservation.photographer = current_user
		current_user.available = false
		if reservation.save!
			render status: :ok, json: { status: 'SUCCESS', name: reservation.photographer.name }
		else
			render status: 422, json: { status: 'FAILED' }
		end
	end

	def edit
		if @photographer != current_user
			redirect_to root_url
		end
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
											:address,
											:city,
											:state,
											:zip,
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
