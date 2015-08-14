## Description

The IMDB Monkey  Allows you to scrape data from IMDB.

## Features

IMDB monkey currently features following

## ACTORS

* Search for list of Actor's movies with years (Working)
* Search for Actor's upcoming movies (working)
* Calculate average movie rating of any actor based on their total movies and their respective ratings (coming soon)
* Find Actor's Highest Rated movie (coming soon)
* Find Actor's Lowest Rated Movie (coming soon)
* Find Actor's info (coming soon)
* Find Movies Actor has produced (coming soon)
* Find Movies Actor has directed (coming soon)
* Find Awards Actor was nominated for (coming soon)
* Find Awards Actor has won (coming soon)
* Find Random trivia on Actors (coming soon)

## MOVIES (COMING SOON)



## Examples

### Actors:

    i = ImdbActor.new("Tom cruise")

    i.actor_movies
    #=> Will return hash with movie as key and year of release as values like shown below. The movies that dont have dates will be empty string.

    {"Mena"=>"2017", "Jack Reacher 2"=>"", "Mission: Impossible 6"=>"", "Top Gun 2"=>"", "Mission: Impossible - Rogue Nation"=>"2015", "Edge of Tomorrow"=>"2014",       "Oblivion"=>"2013/I", "Jack Reacher"=>"2012", "Rock of Ages"=>"2012", "Mission: Impossible - Ghost Protocol"=>"2011", "Knight and Day"=>"2010", "Valkyrie"=>"2008", "Tropic Thunder"=>"2008", "Lions for Lambs"=>"2007", "Mission: Impossible III"=>"2006", "War of the Worlds"=>"2005", "Collateral"=>"2004", "The Last Samurai"=>"2003", "Minority Report"=>"2002", "Vanilla Sky"=>"2001", "Mission: Impossible II"=>"2000", "Magnolia"=>"1999", "Eyes Wide Shut"=>"1999", "Jerry Maguire"=>"1996", "Mission: Impossible"=>"1996", "Interview with the Vampire: The Vampire Chronicles"=>"1994", "The Firm"=>"1993", "A Few Good Men"=>"1992", "Far and Away"=>"1992", "Days of Thunder"=>"1990", "Born on the Fourth of July"=>"1989", "Rain Man"=>"1988", "Cocktail"=>"1988", "The Color of Money"=>"1986", "Top Gun"=>"1986", "Legend"=>"1985", "All the Right Moves"=>"1983", "Risky Business"=>"1983", "Losin' It"=>"1983", "The Outsiders"=>"1983", "Taps"=>"1981", "Endless Love"=>"1981"}

    i.actor_upcoming_movies
    #=> Will return Array of upcoming movies of any actors. In "Tom Cruise"'s case it will be

    ["Mena", "Jack Reacher 2", "Mission: Impossible 6","Top Gun 2"]

### MOVIES: (COMING SOON)

## Contributors

This script and soon to be rubygem is created and maintained by [Suyesh Bhandari](https://www.suyesh.com)

## License

See [WTFPL-LICENSE](http://www.wtfpl.net/txt/copying/)
