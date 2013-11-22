class ReservationsController < ApplicationController
	before_action :set_reservation, only: [:show, :edit, :update, :destroy]
	respond_to :html, :json

	def new
	end

	def create
		@reservation = Reservation.new(customer: current_user, name: params[:name], location: params[:location], lat: params[:lat], lng: params[:lng], date: Time.now)
		if @reservation.save!
			render :status => :ok, :json => { status: 'SUCCESS', url: reservation_path(@reservation) }
		else
			render :status => 422, :json => { status: 'FAILED' }
		end
	end

	def show
		respond_with(@reservation)
	end

	def edit
	end

	def update
		respond_with(@reservation)
	end

	def destroy
		@reservation.destroy
		respond_with(@reservation)
	end


	private

	def set_reservation
		@reservation = Reservation.find(params[:id])
	end

	def reservation_params
		params.require(:reservation).permit(:name, :location, :lat, :lng, :date)
	end
end
