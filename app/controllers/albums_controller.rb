class AlbumsController < ApplicationController

	# @http_method XHR POST
	# @url /documents
	def create
		if current_user.type == "Photographer"
			@album = current_user.albums.create(params[:album])
		else
			redirect_to current_user
		end
	end
end
