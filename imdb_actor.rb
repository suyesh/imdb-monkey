require_relative 'imdb'

class ImdbActor < Imdb

  def initialize(search_param)
    @search_param = search_param.downcase.gsub(" ", "+") if search_param.split.length > 1
  end

  def actor_movies #returns Movies Hash with movie as Key and Year of release as value of Actors
    #returns number of movies
    movie_names = movies_to_array(actor_page.css("div#filmography").css("div.filmo-category-section")[0].css("b a"))
    release_year = years_to_array(actor_page.css("div#filmography").css("div.filmo-category-section")[0].css("span.year_column").to_a)
    movies = Hash.new
    counter = 0
    while counter < movie_names.length
      movies[movie_names[counter]] = release_year[counter]
      counter += 1
    end
    return movies
  end


  def actor_upcoming_movies
    #returns actor's upcoming movies
  end

  def actor_average_movie_rating
    #returns actor's average movie rating based on all movie ratings
  end

  def actor_lowest_rated_movie
    #returns actor's lowest movie rating
  end

  def actor_highest_rated_movie
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

  def movies_to_array(movies)
    movies_a = []
    movies.each do |movie|
      movies_a << movie.text.lstrip.rstrip
    end
    return movies_a
  end

  def years_to_array(years)
    years_a = []
    years.each do |year|
        years_a << year.text.lstrip.rstrip
      end
    return years_a
  end
end
