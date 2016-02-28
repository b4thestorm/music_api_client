class Music
#This model scrapes billboard  
  require 'mechanize'

  agent = Mechanize.new
  page = agent.get('http://www.billboard.com/charts')
 
  genre_page = page.search '//*[@id="block-views-charts-block-bbcom-charts--5"]/div/div/div/div[49]/div[1]/span/a'
  
 genre_page.each do |link|
 get_search_form = Mechanize::Page::Link.new( link, agent, page ).click
 form_input = get_search_form.forms[1]
 form_input['archive-search__input'] = '10/21/2001'
  
binding.pry
#takes me to the search form page
   get_search_form.forms_with(xpath: '//*[@id="main"]/div[3]/div[3]/aside[2]/form/div/input') do |search|
	search.q = ''
   end 
 end 
 
	
	

end
