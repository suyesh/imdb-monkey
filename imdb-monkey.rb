=begin
This Script finds the Average rating and highest/lowest rated movie of an actor's movies
=end
require_relative 'imdb_movie'
require_relative 'imdb_actor'

base_url = "http://www.imdb.com/"
#movie_url = "http://www.imdb.com/title/#{movie_code}/"
#award_page = "http://www.imdb.com/name/#{actor_code}/awards?"

print "Type a Actor's name: "
user_input = gets.chomp

imdb = ImdbActor.new(user_input)

imdb.actor_movies.each {|movie, year| puts "#{movie}.....#{year}"}
puts "#{user_input}'s upcoming #{imdb.actor_upcoming_movies.length > 1 ? "movies are " : "movie is "} #{imdb.actor_upcoming_movies}"
puts "Highest rated movie : #{imdb.actor_highest_rated_movie}"
puts "Lowest rated movie : #{imdb.actor_lowest_rated_movie}"
puts "#{user_input}'s Average movie rating based on all movies is #{imdb.actor_average_movie_rating}"
