class Music
#This model scrapes billboard
require 'nokogiri'
require 'net/http'
require 'capybara/poltergeist'
include ActiveModel::Model
attr_accessor :year, :genre

def initialize(age , genre, user_id)
   @year = age
   @genre = genre
   @id = user_id
end

def get_year
User.where(id: @id).take.year.to_i + @year.to_i
end

def scrape 
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end
Capybara.default_driver = :poltergeist  
 

browser = Capybara.current_session
url = "http://www.billboard.com/charts/#{@genre}"

#grabs the category
browser.visit url 

#enters the form to get the popular singles information 
browser.find(:xpath, '//*[@id="main"]/div[3]/div[3]/aside[2]/form/div/input').set("1021#{get_year}".to_i)
browser.find(:xpath,'//*[@id="main"]/div[3]/div[3]/aside[2]/form/div/button').click
sleep 10
#browser.save_and_open_page # => the begin block should be at this point.
browser.find(:xpath, '//*[@id="main"]/div[3]/div[3]/aside[2]/section/a').click

#collects the list of singles
jackpot_url = browser.current_url
uri = URI(jackpot_url)
body = Net::HTTP.get(uri)
nk_object = Nokogiri::HTML(body)
titles = nk_object.css('.chart-row__title')
one = titles.css('h3').children.text.split(/\n/).map(&:strip).reject(&:empty?)
two = titles.css('h2').children.to_a.each {|x| p x.text}
one.zip(two)

end


end
