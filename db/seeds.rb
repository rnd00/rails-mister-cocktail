# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

# clearance
puts 'Cleanup...'
Cocktail.destroy_all
Ingredient.destroy_all

# fetch the indegrients
puts "Fetching #{url}..."
raw_data = open(url).read
# parse and convert to a string
puts 'Converting raw data to an array...'
raw_arr = JSON.parse(raw_data)
ingredients = raw_arr['drinks'].map { |ing| ing['strIngredient1'] }
# put into db
puts 'Seeding the tables...'
ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end
