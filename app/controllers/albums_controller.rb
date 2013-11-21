class AlbumsController < ApplicationController
	before_action :set_album, only: [:show, :edit, :update, :destroy]
	respond_to :html, :json

	def new
	end

	def create
		@album = Album.new params['album']
		if @album.save
			render :json => { }
		else
			render :json => { }, status: 404
		end
	end

	def show
		respond_with(@album)
	end

	def edit
	end

	def update
		respond_with(@album)
	end

	def destroy
		@album.destroy
		respond_with(@album)
	end


	private

	def set_album
		@album = Album.find(params[:id])
	end

	def album_params
		params.require(:album).permit(:lat, :lng)
	end
end
