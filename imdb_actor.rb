require 'imdb'

class ImdbActor < Imdb
  #Find_person_code finds the person code for the imdb url based on the search. First it downcases search param that user inputs.
  #then it adds + in between the name if its longer than two words, for example if user is looking for Tom Cruise, it turns into tom+Cruise
  #then puts the search param in the search url to get result
  #then nokogiri opens the search url and adds finds the result text in the page.
  #it then extracts the person code from the href of the result
  def find_actor_code(search_param)
    search_param = search_param.downcase
    search_param = search_param.gsub(" ", "+") if search_param.split.length > 1
    search_url = "http://www.imdb.com/find?=#{search_param}"
    page = Nokogiri::HTML(open(search_url))
    actor_url = page.css("div.findSection table.findList td.result_text").css("a")[0]["href"]
    actor_code = person_url.split("/")[2]
    return actor_code
  end

  def actor_movies(actor_page)
    #returns number of movies
  end

  def actor_upcoming_movies(actor_page)
    #returns actor's upcoming movies
  end

  def actor_average_movie_rating(actor_page)
    #returns actor's average movie rating based on all movie ratings
  end

  def actor_lowest_rating(actor_page)
    #returns actor's lowest movie rating
  end

  def actor_highest_rating(actor_page)
    #returns actor's Highest movie rating
  end

  def actor_info(actor_page)
    #returns actor's bio
  end

  def actor_awards_nominated(actor_page)
  end

  def actor_awards_won(actor_page)
  end

  def actor_produced_movies(actor_page)
  end

  def actor_directed_movies(actor_page)
  end

  def actor_random_trivia(actor_page)
  end
end
