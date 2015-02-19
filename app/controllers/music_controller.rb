class MusicController < ApplicationController
	
	def index
		@genre = params[:genre]
		@year = params[:year]
	end

end