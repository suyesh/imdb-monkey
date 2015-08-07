require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "http://www.imdb.com/"
page = Nokogiri::HTML(open(PAGE_URL))

movie_list =  {}
movies = page.css("div[class= 'title']").css("a").to_a
i = 0

while i < movies.length
  movie_list[movies[i].text] = PAGE_URL + movies[i]["href"]
  i += 1
end

movie_list.each do |movie, url|
  puts "#{movie}--URL: #{url}"
end
