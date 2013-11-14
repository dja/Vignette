require 'spec_helper'

describe CustomersController do

	describe 'GET#index' do
		it 'should show index' do
			get :index
			expect(response).to render_template('index')
		end
	end

	describe 'GET#new' do
		before do
			get :new
		end

		it 'should show new' do
			expect(response).to render_template('new')
		end

		it 'should show new Customer form' do
			
		end

		it 'should require email and password' do

		end
	end

	describe 'POST#create' do
		it 'should create a new Customer' do
			test_customer = FactoryGirl.create :customer
			post :create, customer: test_customer.attributes
			expect(Customer.last.name).to eq(test_customer[:name])
		end
	end

end
