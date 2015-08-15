require_relative 'imdb'

class ImdbActor < Imdb

  def actor_movies #returns Movies Hash with movie as Key and Year of release as value of Actors
    movie_names = actor_movies_to_array(actor_page.css("div#filmography").css("div.filmo-category-section")[0].css("b a"))
    release_year = actor_years_to_array(actor_page.css("div#filmography").css("div.filmo-category-section")[0].css("span.year_column").to_a)
    movies = Hash.new
    counter = 0
    while counter < movie_names.length #this loop creates hash of movie with movie name and movie release year
      movies[movie_names[counter]] = release_year[counter]
      counter += 1
    end
    return movies
  end


  def actor_upcoming_movies
    #returns Array of actor's upcoming movies
    movie_title = []
    movie_names = actor_page.css(".in_production")
    in_production_codes = []
    movie_names.each do |movie|
      in_production_codes << retrieve_production_code(movie["href"]) #retrieve_production_code method retrieves movie code from the href
    end
    in_production_codes.each do |code|
      movie_url = Nokogiri::HTML(open("http://www.imdb.com/title/#{code}/"))
      movie_title << movie_url.css("td#overview-top").css("h1.header").css("span.itemprop")[0].text
    end
    movie_title = movie_title.uniq #for some reason there was doubles thats why had to do uniq. couldnt figure out why the double movies.
    return movie_title
  end

  def actor_average_movie_rating
    #returns actor's average movie rating based on total of all movie ratings divived my number of movies.
    movies = actor_page.css("div#filmography").css("div.filmo-category-section")[0].css("b a")
    movies_url_code = []
    movies_score = []
    movies.each do |movie|
      movies_url_code << movie["href"].split("/")[2]
    end
    while movies_score.length < movies_url_code.length
      page = Nokogiri::HTML(open("http://www.imdb.com/title/#{movies_url_code[movies_score.length]}"))
      movies_score << page.css("div.titlePageSprite.star-box-giga-star").text.to_f
    end
    total_score=  movies_score.reduce(:+)
    average_score = total_score / movies_url_code.length
    return average_score.round(1)
  end

  def actor_lowest_rated_movie
    #returns actor's lowest movie rating
    movies = actor_page.css("div#filmography").css("div.filmo-category-section")[0].css("b a")
    movies_url_code = []
    movies_score = Hash.new
    movies.each do |movie|
      movies_url_code << movie["href"].split("/")[2]
    end
    while movies_score.length < movies_url_code.length
      page = Nokogiri::HTML(open("http://www.imdb.com/title/#{movies_url_code[movies_score.length]}"))
      movies_score[page.css("h1.header").css("span.itemprop").text] = page.css("div.titlePageSprite.star-box-giga-star").text.to_f
    end
    lowest_rated_movie_a = movies_score.select{|k,v| v > 0}.sort_by {|movie, score| score }.first
    lowest_rated_movie = Hash.new
    lowest_rated_movie[lowest_rated_movie_a[0]] = lowest_rated_movie_a[1]
    return lowest_rated_movie
  end

  def actor_movies_with_rating
    #returns Hash of movies and respective ratings as values
    movies = actor_page.css("div#filmography").css("div.filmo-category-section")[0].css("b a")
    movies_url_code = []
    movies_score = Hash.new
    movies.each do |movie|
      movies_url_code << movie["href"].split("/")[2]
    end
    while movies_score.length < movies_url_code.length
      page = Nokogiri::HTML(open("http://www.imdb.com/title/#{movies_url_code[movies_score.length]}"))
      movies_score[page.css("h1.header").css("span.itemprop").text] = page.css("div.titlePageSprite.star-box-giga-star").text.to_f
    end
    return movies_score
  end

  def actor_highest_rated_movie
    #returns actor's Highest movie rating
    movies = actor_page.css("div#filmography").css("div.filmo-category-section")[0].css("b a")
    movies_url_code = []
    movies_score = Hash.new
    movies.each do |movie|
      movies_url_code << movie["href"].split("/")[2]
    end
    while movies_score.length < movies_url_code.length
      page = Nokogiri::HTML(open("http://www.imdb.com/title/#{movies_url_code[movies_score.length]}"))
      movies_score[page.css("h1.header").css("span.itemprop").text] = page.css("div.titlePageSprite.star-box-giga-star").text.to_f
    end
    highest_rated_movie_a = movies_score.select{|k,v| v > 0}.sort_by {|movie, score| score }.last
    highest_rated_movie = Hash.new
    highest_rated_movie[highest_rated_movie_a[0]] = highest_rated_movie_a[1]
    return highest_rated_movie
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
