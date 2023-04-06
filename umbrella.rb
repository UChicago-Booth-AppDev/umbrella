p "Where are you located?"

user_location = gets. chomp
# user_location = "Chicago"

p user_location

gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{ENV.fetch("GMAPS_KEY")}"

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

# p latitude
# p longitude

pirate_weather_url = "https://api.pirateweather.net/forecast/#{ENV.fetch("PIRATE_WEATHER_KEY")}/#{latitude},#{longitude}"

# p pirate_weather_url

require "open-uri"

raw_response_weather = URI.open(pirate_weather_url).read

require "json"

parsed_response_weather = JSON.parse(raw_response_weather)

# p parsed_response_weather

currently_hash = parsed_response_weather.fetch("currently")

# p currently_hash

current_summary = currently_hash.fetch("summary")

p "It is currently #{current_summary}"

current_temperature = currently_hash.fetch("temperature")

p "The temperature is #{current_temperature} Farenheit"

hourly_hash = parsed_response_weather.fetch("hourly")

hourly_data = hourly_hash.fetch("data")

# p hourly_data[0].fetch("precipProbability")
# p hourly_data[0].fetch("precipProbability").class

if hourly_data[0].fetch("precipProbability") > 0.1
    p "You might want to carry an umbrella"
      elsif hourly_data[1].fetch("precipProbability") > 0.1
        p "You might want to carry an umbrella"
      elsif hourly_data[2].fetch("precipProbability") > 0.1
        p "You might want to carry an umbrella"
      elsif hourly_data[3].fetch("precipProbability") > 0.1
        p "You might want to carry an umbrella"
      elsif hourly_data[4].fetch("precipProbability") > 0.1
        p "You might want to carry an umbrella"
      elsif hourly_data[5].fetch("precipProbability") > 0.1
        p "You might want to carry an umbrella"
      elsif hourly_data[6].fetch("precipProbability") > 0.1
        p "You might want to carry an umbrella"
      elsif hourly_data[7].fetch("precipProbability") > 0.1
        p "You might want to carry an umbrella"
      elsif hourly_data[8].fetch("precipProbability") > 0.1
        p "You might want to carry an umbrella"
      elsif hourly_data[9].fetch("precipProbability") > 0.1
        p "You might want to carry an umbrella"
      elsif hourly_data[10].fetch("precipProbability") > 0.1
        p "You might want to carry an umbrella"
      elsif hourly_data[11].fetch("precipProbability") > 0.1
        p "You might want to carry an umbrella"
      else
        p "You probably won't need an umbrella today"    
end
