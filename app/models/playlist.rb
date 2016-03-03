class Playlist < ActiveRecord::Base
  belongs_to :user
  #has_many :songs
  AVAILABLE_GENRES = ['r-and-b-songs', 'r-b-hip-hop-songs', 'rap-song', 'country-songs'] 
end
