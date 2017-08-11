# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

result = JSON.parse(open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)

result["drinks"].each do |ing|
  Ingredient.create(name: ing["strIngredient1"])
end

p result


url = "http://img.clubic.com/07791435-photo-playstation.jpg"
product = Product.new(name: 'Playstation')
product.save!
product.photo_url = url
