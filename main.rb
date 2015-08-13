=begin
This Script finds the Average rating and highest/lowest rated movie of an actor's movies
=end
require_relative 'imdb_movie'
require_relative 'imdb_actor'

base_url = "http://www.imdb.com/"
#movie_url = "http://www.imdb.com/title/#{movie_code}/"
#award_page = "http://www.imdb.com/name/#{actor_code}/awards?"

puts "Who do you wanna search?"

user_input = gets.chomp

imdb = ImdbActor.new(user_input)



imdb.actor_movies.each do |key, value|
  puts  "#{key}....#{value}"
end
