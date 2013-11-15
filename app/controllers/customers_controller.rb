class CustomersController < ApplicationController

	def index
	end

	def new
		session[:user_type] = "Customer"
	end

	def create
		redirect_to customers_url
	end

	def show
		@customer = Customer.find(params[:id])
	end
end
