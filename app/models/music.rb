class Music
#this model sets-up the query for the discogs api
 
  include HTTParty
  base_uri 'https://api.discogs.com'
  format :json

  HEADERS = {
      'User-Agent' => 'music_time/0.1'
    } 



  def self.query_songs
  response = get("/database/search?per_page=25&country=US&genre=Hip+Hop&year=2001&key=#{ENV['DISCOGS_API_KEY']}&secret=#{ENV['DISCOGS_SECRET_KEY']}", 'headers' => Music::HEADERS )
  end

	
	

end
