=begin
This Script finds the Average rating and highest/lowest rated movie of an actor's movies
=end
require 'rubygems'
require 'nokogiri'
require 'open-uri'

base_url = "http://www.imdb.com/"
movie_url = "http://www.imdb.com/title/#{movie_code}/"
award_page = "http://www.imdb.com/name/#{actor_code}/awards?"







puts "Welcome to IMDB, Which actor are you looking for?"
user_input = gets.chomp
person_code = find_actor_code(user_input)

person_url = "http://www.imdb.com/name/#{person_code}/"

person_page = Nokogiri::HTML(open(person_url))

puts person_page
