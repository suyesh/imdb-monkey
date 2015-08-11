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

  def find_person_code(search_param)
    search_param = search_param.downcase
    search_param = search_param.gsub(" ", "+") if search_param.split.length > 1
    search_url = "http://www.imdb.com/find?=#{search_param}"
    page = Nokogiri::HTML(open(search_url))
    person_url = page.css("div.findSection table.findList td.result_text").css("a")[0]["href"]
    person_code = person_url.split("/")[2]
    puts person_code
  end

user_input = gets.chomp
find_person_code(user_input)
