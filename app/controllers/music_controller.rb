class MusicController < ApplicationController
	require 'json'
	def index
		#artist id number
		@id = params[:id]
		#age of person
		@age = params[:age]
		#dob of person
		@dob= params[:dob]
	end

	def new 
		@search = Music.query_songs		
	end


end
