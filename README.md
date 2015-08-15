## Description

The IMDB Monkey  Allows you to scrape data from IMDB.

NOTE:::: ITS IN VERY INFANCY PHASE. ITS NOT A GEM YET. JUST WORKING ON GETING ALL FUNCTIONS WORKING.

## Features

IMDB monkey currently features following

## ACTORS

* Search for list of Actor's movies with years (WORKS!)
* Search for Actor's upcoming movies (WORKING)
* Calculate average movie rating of any actor based on their total movies and their respective ratings (WORKS!)
* Find Actor's Highest Rated movie (WORKS!)
* Find Actor's Lowest Rated Movie (WORKS!)
* List all movies of an actor with its Rating (WORKS!)
* Find Actor's info (coming soon)
* Find Movies Actor has produced (coming soon)
* Find Movies Actor has directed (coming soon)
* Find Awards Actor was nominated for (coming soon)
* Find Awards Actor has won (coming soon)
* Find Random trivia on Actors (coming soon)

## MOVIES (COMING SOON)



## Examples of what's currently WORKING

### Actors:

    i = ImdbActor.new("Tom cruise")

    i.actor_movies
    #=> Will return hash with movie as key and year of release as values like shown below. The movies that dont have dates will be empty string.

    {"Mena"=>"2017", "Jack Reacher 2"=>"", "Mission: Impossible 6"=>"", "Top Gun 2"=>"", "Mission: Impossible - Rogue Nation"=>"2015", "Edge of Tomorrow"=>"2014",       "Oblivion"=>"2013/I", "Jack Reacher"=>"2012", "Rock of Ages"=>"2012", "Mission: Impossible - Ghost Protocol"=>"2011", "Knight and Day"=>"2010", "Valkyrie"=>"2008", "Tropic Thunder"=>"2008", "Lions for Lambs"=>"2007", "Mission: Impossible III"=>"2006", "War of the Worlds"=>"2005", "Collateral"=>"2004", "The Last Samurai"=>"2003", "Minority Report"=>"2002", "Vanilla Sky"=>"2001", "Mission: Impossible II"=>"2000", "Magnolia"=>"1999", "Eyes Wide Shut"=>"1999", "Jerry Maguire"=>"1996", "Mission: Impossible"=>"1996", "Interview with the Vampire: The Vampire Chronicles"=>"1994", "The Firm"=>"1993", "A Few Good Men"=>"1992", "Far and Away"=>"1992", "Days of Thunder"=>"1990", "Born on the Fourth of July"=>"1989", "Rain Man"=>"1988", "Cocktail"=>"1988", "The Color of Money"=>"1986", "Top Gun"=>"1986", "Legend"=>"1985", "All the Right Moves"=>"1983", "Risky Business"=>"1983", "Losin' It"=>"1983", "The Outsiders"=>"1983", "Taps"=>"1981", "Endless Love"=>"1981"}

    i.actor_upcoming_movies
    #=> Will return Array of upcoming movies of any actors. In "Tom Cruise"'s case as of (08/13/2015) it will be

    ["Mena", "Jack Reacher 2", "Mission: Impossible 6","Top Gun 2"]

    i.actor_average_movie_rating
    #=> Will fetch all the ratings of all the movies of an actor, totals them and then divides them with number of movies to get average. "Tom cruise" will give you 6.2
    #=> Note: Running this will take a few minute since it has to go fetch every movies of the actor's and their ratings and total it and divide it with the total number of movies.

    => 6.2

    i.actor_lowest_rated_movie
    #=> Will return a hash with lowest rated movie name as key and rating as value. In case of "Tom Cruise" it returns
    {"Endless Love" => 4.7}

    i.actor_highest_rated_movie
    #=> Will return a hash with Highest rated movie name as key and rating as value. In case of "Tom Cruise" it returns
    {"Rain Man"=> 8.0}

    i.actor_movies_with_rating
    #=> Will return Hash with actor's movie's name as key and rating as value. In case of "Tom Cruise" it returns

    {"Mena"=>0.0, "Jack Reacher 2"=>0.0, "Mission: Impossible 6"=>0.0, "Top Gun 2"=>0.0, "Mission: Impossible - Rogue Nation"=>7.9, "Edge of Tomorrow"=>7.9, "Oblivion"=>7.0, "Jack Reacher"=>7.0, "Rock of Ages"=>5.9, "Mission: Impossible - Ghost Protocol"=>7.4, "Knight and Day"=>6.3, "Valkyrie"=>7.1, "Tropic Thunder"=>7.0, "Lions for Lambs"=>6.2, "Mission: Impossible III"=>6.9, "War of the Worlds"=>6.5, "Collateral"=>7.6, "The Last Samurai"=>7.7, "Minority Report"=>7.7, "Vanilla Sky"=>6.9, "Mission: Impossible II"=>6.0, "Magnolia"=>8.0, "Eyes Wide Shut"=>7.3, "Jerry Maguire"=>7.3, "Mission: Impossible"=>7.1, "Interview with the Vampire: The Vampire Chronicles"=>7.6, "The Firm"=>6.8, "A Few Good Men"=>7.6, "Far and Away"=>6.5, "Days of Thunder"=>5.9, "Born on the Fourth of July"=>7.2, "Rain Man"=>8.0, "Cocktail"=>5.8, "The Color of Money"=>7.0, "Top Gun"=>6.8, "Legend"=>6.5, "All the Right Moves"=>5.9, "Risky Business"=>6.8, "Losin' It"=>4.8, "The Outsiders"=>7.2, "Taps"=>6.7, "Endless Love"=>4.7}


### MOVIES: (COMING SOON)

## Contributors

This script and soon to be rubygem is created and maintained by [Suyesh Bhandari](https://www.suyesh.com)

## License

See [WTFPL-LICENSE](http://www.wtfpl.net/txt/copying/)
