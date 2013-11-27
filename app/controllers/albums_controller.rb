class AlbumsController < ApplicationController

	# @http_method XHR POST
	# @url /documents
	def create
		if current_user.type == "Photographer"
			@album = current_user.albums.create!(album_params)
		else
			redirect_to current_user
		end
	end

private

	def album_params
        params.require(:album).permit(:direct_upload_url)
    end
end
