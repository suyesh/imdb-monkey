=begin
This Script finds the Average rating and highest/lowest rated movie of an actor's movies
=end
require_relative 'imdb_movie'
require_relative 'imdb_actor'

base_url = "http://www.imdb.com/"
#movie_url = "http://www.imdb.com/title/#{movie_code}/"
#award_page = "http://www.imdb.com/name/#{actor_code}/awards?"
puts "************************************************************************"
puts "Right Now i can only search Actors and their movies with its release year :(".rjust(20)
puts "Pretty soon i will be able to do much much more.".rjust(20)
puts "For now just type the name of the actor you want to search.".rjust(20)
puts "************************************************************************"
print "Type a Actor's name: "
user_input = gets.chomp

imdb = ImdbActor.new(user_input)

puts imdb.actor_average_movie_rating
