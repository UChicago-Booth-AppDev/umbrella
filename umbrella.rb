p "Where are you located?"

# user_location = gets. chomp
user_location = "Chicago"

p user_location

gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key="

require "open-uri"

raw_response = URI.open(gmaps_url).read

# p raw_response.length 

#The data that we want is somewhere in there. We can use the parse method! --> JSON.parse

require "json"

parsed_response = JSON.parse(raw_response)

results_array = parsed_response.fetch("results")

first_result = results_array.at(0)

geo = first_result.fetch("geometry")

loc = geo.fetch("location")

latitude = loc.fetch("lat")
longitude = loc.fetch("lng")

p latitude
p longitude
