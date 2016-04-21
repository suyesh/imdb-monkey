# This Script finds the Average rating and highest/lowest rated movie of an actor's movies
require_relative 'imdb_movie'
require_relative 'imdb_actor'

base_url = 'http://www.imdb.com/'
# movie_url = "http://www.imdb.com/title/#{movie_code}/"
# award_page = "http://www.imdb.com/name/#{actor_code}/awards?"
puts "\n"
print "Type a Actor's name: "
user_input = gets.chomp
puts "\n"
imdb = ImdbActor.new(user_input)
puts 'Calculating Average'
average_rating = imdb.actor_average_movie_rating { |i| print i }
puts "\n"
puts "The average rating of #{user_input}'s all movies is #{average_rating}"
puts "\n"
puts 'Finding Highest Rated Movie'
highest = imdb.actor_highest_rated_movie { |i| print i }
puts "\n"
highest.each do |name, rating|
    puts "#{user_input}'s Highest rated movie is #{name} with the rating of #{rating}"
end
puts "\n"
puts 'Finding Lowest Rated Movie'
lowest = imdb.actor_lowest_rated_movie { |i| print i }
puts "\n"
lowest.each do |name, rating|
    puts "#{user_input}'s lowest rated movie is #{name} with the rating of #{rating}"
end
