class MusicController < ApplicationController
	require 'json'
	
	def new 
		@search = Music.query_songs		
	end


end
