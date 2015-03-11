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
		@id = params[:id]
		@search = Music.get_artist(@id)
		@content = JSON.parse(@search.body)
		puts @content
	end


end