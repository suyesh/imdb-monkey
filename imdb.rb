require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Imdb

  def initialize(search_param)
    @search_param = search_param.downcase.gsub(" ", "+") if search_param.split.length > 1
  end

  private

  def find_actor_code
    search_url = "http://www.imdb.com/find?=#{@search_param}"
    page = Nokogiri::HTML(open(search_url))
    search_page = page.css("div.findSection table.findList td.result_text").css("a")[0]["href"]
    actor_code = search_page.split("/")[2]
    return actor_code
  end

  def actor_page
    actor_url = "http://www.imdb.com/name/#{find_actor_code}/"
    actor_page = Nokogiri::HTML(open(actor_url))
    return actor_page
  end

  def actor_movies_to_array(movies)
    movies_a = []
    movies.each do |movie|
      movies_a << movie.text.lstrip.rstrip
    end
    return movies_a
  end

  def actor_years_to_array(years)
    years_a = []
    years.each do |year|
        years_a << year.text.lstrip.rstrip
      end
    return years_a
  end

  def retrieve_production_code(production_url)
    production_url_code = production_url.split("/")[4] #i wish there was better way of doing this, this is almost like hack.
    return production_url_code
  end
end
