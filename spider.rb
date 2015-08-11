require 'rubygems'
require 'nokogiri'
require 'open-uri'
search_param = nil
movie_code = nil
person_code = nil
base_url = "http://www.imdb.com/"
search_url = "http://www.imdb.com/find?rq=#{search_param}"
movie_url = "http://www.imdb.com/title/#{movie_code}/"
person_url = "http://www.imdb.com/name/#{person_code}/"

def find_movie_code(search_param)
  return "Tom Cruise"
end

#Find_person_code finds the person code for the imdb url based on the search. First it downcases search param that user inputs.
#then it adds + in between the name if its longer than two words, for example if user is looking for Tom Cruise, it turns into tom+Cruise
#then puts the search param in the search url to get result
#then nokogiri opens the search url and adds finds the result text in the page.
#it then extracts the person code from the href of the result
def find_person_code(search_param)
  search_param = search_param.downcase
  search_param = search_param.gsub(" ", "+") if search_param.split.length > 1
  search_url = "http://www.imdb.com/find?=#{search_param}"
  page = Nokogiri::HTML(open(search_url))
  person_url = page.css("div.findSection table.findList td.result_text").css("a")[0]["href"]
  person_code = person_url.split("/")[2]
  return person_code
end
