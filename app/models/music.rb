class Music
#this model sets-up the query for the discogs api
 
  include HTTParty
  base_uri 'https://api.discogs.com'
  format :json

  HEADERS = {
	'User-Agent' => 'Music_List/0.1', 
	:key => ENV['DISCOGS_API_KEY'], 
	:secret => ENV['DISCOGS_SECRET_KEY']})
	} 


  def self.query_songs(genre,year)
  response = get("database/search?per_page=25&country=US&genre=Hip+Hop&year=2001", headers: Music::HEADERS )
  end

	
	

end
