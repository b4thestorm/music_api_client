class PlaylistController < ApplicationController
require 'json'
 before_action :require_login
 before_action :set_user

   def index
    if params
    @search = Music.new(params[:age], params[:genre])
    binding.pry
    end
   end

   def new  
     @playlist = Playlist.new	
   end
	
   def create
    @playlist = Playlist.new(playlist_params)
    binding.pry
    if @playlist.save 
    flash[:notice] = '...Searching through Genre'
    else
    render :new
    end 
   end 

private
 
   def playlist_params
   params.require(:playlist).permit(:age, :genre)
   end

   def set_user
    @user = current_user
   end 
end
