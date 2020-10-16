# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def api_call(url)
    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    json_response = JSON.parse(response.read_body)    
    
end

byebug


# api_call("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.6162787,-73.9987585&radius=500&keyword=bank&key=#{ENV["API_KEY"]}")

# api_call("https://maps.googleapis.com/maps/api/geocode/json?address=7205+17th+Avenue,+Brooklyn,+NY&key=#{ENV["API_KEY"]}")
api_call("https://maps.googleapis.com/maps/api/geocode/json?address=7205+17th+Avenue,+Brooklyn,+NY&key=#{ENV["API_KEY"]}")