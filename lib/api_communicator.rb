require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character)
    all_characters = RestClient.get('http://www.swapi.co/api/people/')
    character_hash = JSON.parse(all_characters)

 # iterate over the character hash to find the collection of `films` for the given
 #    # `character`
      film_description=nil
      films_hash=[]

        character_hash["results"].each do |people|
        if people["name"] == character
          people["films"].each do |film|
            films_hash<<film
        end
          end
          end
        films_hash

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
 #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end



def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  film_array = []
  films_hash.each do |character|
    unparsed= RestClient.get(character)
    film_description = JSON.parse(unparsed)
    film_array << film_description
  end
  film_array
end


def show_character_movies(character)
  titles = []
  films_hash = get_character_movies_from_api(character)
  description = parse_character_movies(films_hash)
  description.each do |hash|
    titles << hash["title"]
end
  puts titles
end



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
