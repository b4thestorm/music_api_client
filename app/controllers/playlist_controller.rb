class PlaylistController < ApplicationController
require 'json'

   def index
    @user = current_user
   end

   def new  
     @search = Music.new	
   end
end
