require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

# Your code goes below. Use the same approach as you did in
#   address_to_coords.rb to read from a remote API and parse
#   the results.

weather_url = "https://api.forecast.io/forecast/23f3953b05f926b4064525e3392e120f/" + the_latitude.to_s + "," + the_longitude.to_s
currentforecast_raw = open(weather_url).read
parsed_weatherdata = JSON.parse(currentforecast_raw)

the_temperature = parsed_weatherdata["currently"]["temperature"]
the_hour_outlook = parsed_weatherdata["hourly"]["data"][1]["summary"]
the_day_outlook = parsed_weatherdata["daily"]["data"][1]["summary"]

# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
