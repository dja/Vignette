class AlbumsController < ApplicationController

	# @http_method XHR POST
	# @url /documents
	def create
	  @album = current_user.albums.create(params[:album])
	end
end
