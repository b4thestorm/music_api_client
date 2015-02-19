class Music
	include HTTParty
	base_uri 'https://api.discogs.com'
 

	def initialize(genre,year)
		self.genre = genre
		self.year = year
	end

	def api_key
		ENV['DISCOGS_API_KEY']
	end

	def secret
		ENV['DISCOGS_SECRET_KEY']
	end

	#.get{base_path}genre="hiphop"&year="1997"&per_page=50&page=1, headers: 
	def base_path
		"/database/search?"
	end

	def handle_timeouts
		begin
			yield
		rescue Net::OpenTimeout, Net::ReadTimeout
			{}
		end
	end


	def genre=(genre)
		self[:genre] = genre
	end

	def year=(year)
		self[:year] = year
	end

	def full_search
	response = get("#{base_path}genre=#{genre}&year=#{year}&per_page=50&page=1&#{api_key}&#{secret}", headers: {"User-Agent" => "music_list/0.1"})  
	end
	


	


end