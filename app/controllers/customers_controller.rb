class CustomersController < ApplicationController
	before_action :set_customer, only: [:show, :edit, :update, :destroy]
	respond_to :html

	def new
	end

	def create
		redirect_to @customer
	end

	def show
		respond_with(@customer)
	end

	def edit
	end

	def update
		respond_with(@customer)
	end

	def destroy
		@customer.destroy
		respond_with(@customer)
	end


	private

	def set_customer
		@customer = Customer.find(params[:id])
	end

	def customer_params
		params.require(:customer).permit(:name,
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
											:uid,
											:provider,
											:oauth_token,
											:oauth_expires_at)
	end
end
