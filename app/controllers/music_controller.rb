class MusicController < ApplicationController
	
	def index
		#Displays the splash page
	end

	def new
		@genre = params[:genre]
		@year = params[:year]
		@search = Music.new(@genre,@year)
	end

	def create
		@search.full_search if @search.save
	end

end