require 'spec_helper'

describe PhotographersController do
	render_views

	before do
		@photog = Photographer.create(name: "Sylvia Sly", first_name: "Sylvia", last_name: "Sly", user_location: "Santa Monica, CA")
	end

	let(:valid_attributes) { { name => "Sylvia" } }

	let(:valid_session) { { } }

	describe 'GET#new' do

		it 'render new template' do
			get :new
			expect(response).to render_template('new')
		end
	end

	describe 'POST#create' do
		it 'authenticates invite code' do
		end
		
		it 'creates a new Photographer' do
			post :create, photographer: @photog
			expect(Photographer.last.first_name).to eq(@photog[:first_name])
		end
	end

	describe 'GET#show' do

		it 'render show template' do
			get :show, { id: @photog.id }, valid_session
			expect(response).to render_template('show')
		end
	end

	describe 'GET#edit' do

		it 'renders edit page' do
			get :edit, { id: @photog.id }, valid_session
			expect(response).to render_template('edit')
		end
	end

	describe 'PUT#update' do


		it 'updates the Photographer profile' do
			put :update, {id: @photog.id, photographer: { name: "Stylvia" }}, valid_session
		end

	end

	describe 'DELETE#destroy' do
		it 'destroys the requested photographer' do
			expect {
				delete :destroy, { id: @photog.id }, valid_session
			}.to change(Photographer, :count).by(-1)
		end
	end

end
