class PhotographersController < ApplicationController

	def index
	end

	def new
		session[:user_type] = "Photographer"
	end

	def create
		redirect_to customers_url
	end

	def show
		@photographer = Photographer.find(params[:id])
	end
end
