class Music
#This model scrapes billboard
require 'nokogiri'
require 'net/http'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end
Capybara.default_driver = :poltergeist  
 

browser = Capybara.current_session  
url = 'http://www.billboard.com/charts'

#grabs the category
browser.visit url 
browser.all(:xpath, '//*[@id="block-views-charts-block-bbcom-charts--5"]/div/div/div/div[49]/div[1]/span/a')[0].click

#enters the form to get the popular singles information 
browser.find(:xpath, '//*[@id="main"]/div[3]/div[3]/aside[2]/form/div/input').set(10212001)
browser.find(:xpath,'//*[@id="main"]/div[3]/div[3]/aside[2]/form/div/button').click
sleep 5
browser.find(:xpath, '//*[@id="main"]/div[3]/div[3]/aside[2]/section/a').click

#collects the list of singles
jackpot_url = browser.current_url
uri = URI(jackpot_url)
body = Net::HTTP.get(uri)
nk_object = Nokogiri::HTML(body)
titles = nk_object.css('.chart-row__title')
titles.each do |node_element|
puts node_element.text
end



end
