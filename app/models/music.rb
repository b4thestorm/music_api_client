class Music
	include HTTParty
	base_uri 'https://api.discogs.com' 
 	#default_params :api_key => ENV['DISCOGS_API_KEY'], :secret_key => ENV['DISCOGS_SECRET_KEY']


	#.get{base_path}genre="hiphop"&year="1997"&per_page=50&page=1, headers: 
	
	def self.year_desired(age,dob)
		age.to_i + dob.to_i
	end

	 # def self.get_genre_by_year(genre,year)
	 # 	get("database/search?genre=#{genre}&year=#{year}&per_page=50&page=1")
	 # end  


	 def self.get_artist(id)
	 	response = get("/artists/#{id}/releases", headers: {"User-Agent" => 'Music_List/0.1'})
	 end

	 # def full_search
	 # response = get("#{base_path}genre=#{genre}&year=#{year}&per_page=50&page=1&#{api_key}&#{secret}")  
	 # end
	
	

end