class MusicController < ApplicationController
	require 'json'
	def index
		@id = params[:id]	
	end

	def new 
		@id = params[:id]
		@search = Music.get_artist(@id)
		@json = JSON.parse(@search) 
	end


end