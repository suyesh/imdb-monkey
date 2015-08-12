require_relative 'imdb'

class ImdbActor < Imdb

  def initialize(search_param)
    @search_param = search_param.downcase.gsub(" ", "+") if search_param.split.length > 1
  end
  #Find_person_code finds the person code for the imdb url based on the search. First it downcases search param that user inputs.
  #then it adds + in between the name if its longer than two words, for example if user is looking for Tom Cruise, it turns into tom+Cruise
  #then puts the search param in the search url to get result
  #then nokogiri opens the search url and adds finds the result text in the page.
  #it then extracts the person code from the href of the result
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

  def actor_movies
    #returns number of movies
    movies = actor_page.css

  end

  def actor_upcoming_movies
    #returns actor's upcoming movies
  end

  def actor_average_movie_rating
    #returns actor's average movie rating based on all movie ratings
  end

  def actor_lowest_rating
    #returns actor's lowest movie rating
  end

  def actor_highest_rating
    #returns actor's Highest movie rating
  end

  def actor_info
    #returns actor's bio
  end

  def actor_awards_nominated
    #returns movies actor was nominated for
  end

  def actor_awards_won
    #returns awards actor have won
  end

  def actor_produced_movies
    #returns movies actor have produced
  end

  def actor_directed_movies
    #returns movies actor have directed
  end

  def actor_random_trivia
    #returns random trivia if actor through trivia page
  end
end
