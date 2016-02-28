class Music
#This model scrapes billboard
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end
Capybara.default_driver = :poltergeist  
 
require 'capybara/poltergeist'

browser = Capybara.current_session  
url = 'http://www.billboard.com/charts'

#grabs the category
browser.visit url 
browser.all(:xpath, '//*[@id="block-views-charts-block-bbcom-charts--5"]/div/div/div/div[49]/div[1]/span/a')[0].click

#grabs the form
browser.find(:xpath, '//*[@id="main"]/div[3]/div[3]/aside[2]/form/div/input').set('10/21/2001')
browser.find(:xpath, '//*[@id="main"]/div[3]/div[3]/aside[2]/form/div/button').click 


browser.save_and_open_page
  
# genre_page.each do |link|
# get_search_form = Mechanize::Page::Link.new( link, agent, page ).click
# form_input = get_search_form.forms[1]
# form_input['archive-search__input'] = '10/21/2001'
  
#takes me to the search form page
#   get_search_form.forms_with(xpath: '//*[@id="main"]/div[3]/div[3]/aside[2]/form/div/input') do |search|
#   end 
# end 
 
	
	

end
