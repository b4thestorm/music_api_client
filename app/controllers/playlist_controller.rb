class PlaylistController < ApplicationController
require 'json'
 before_action :require_login
 before_action :set_user

   def index; end

   def new  
     @playlist = Playlist.new	
   end

private 
   
   def set_user
    @user = current_user
   end 
end
