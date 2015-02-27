class MusicController < ApplicationController
	require 'json'
	def index
		@id = params[:id]
		@age = params[:age]
		@dob= params[:dob]
	end

	def new 
		@id = params[:id]
		@age = params[:age]
		@dob = params[:dob]
		@year= Music.year_desired(@age,@dob).to_s
		#@search = Music.get_artist(@id)
	end


end