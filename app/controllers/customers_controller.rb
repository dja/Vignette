class CustomersController < ApplicationController

	def index
	end

	def new
	end

	def create
		redirect_to customers_url
	end
end
