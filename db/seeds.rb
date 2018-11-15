# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts 'Cleaning database...'
Ingredient.destroy_all

puts 'Creating ingredients...'
ingredients_attributes = [
  {
    name:         'lemon'
  },
  {
    name:         'ice'
  },
  {
    name:         'mint leaves'
  }
]
Ingredient.create!(ingredients_attributes)
puts 'Finished!'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

drink_hash = JSON.parse(open(url).read)
drink_hash["drinks"].each do |drink|
  Ingredient.create(name: drink["strIngredient1"])
end

puts "created #{Ingredient.all.count} ingredients!"

puts 'Creating Cocktails...'
# 12.times do
#   cocktail = Cocktail.new(
#     name:    Faker::Coffee.blend_name
#   )
#   cocktail.save!
# end
# puts "created #{Cocktail.all.count} cocktails!"

15.times do
  url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
  drink_hash = JSON.parse(open(url).read)
  drink = drink_hash["drinks"].first
  cocktail = Cocktail.new(name: drink["strDrink"], pic: drink["strDrinkThumb"])
  cocktail.save
  puts "created cocktail #{cocktail.name}!"
  (1..15).each do |n|
    ingredient_key = "strIngredient#{n}"
    dose_key = "strMeasure#{n}"
    puts "#{ingredient_key} and #{dose_key}"
    break if drink[ingredient_key] == ''
    ingredient = Ingredient.find_by_name(drink[ingredient_key])
    dose = Dose.new(description: drink[dose_key])
    dose.ingredient = ingredient
    dose.cocktail = cocktail
    dose.save
    puts "created #{cocktail.doses.count} doses"
  end
end

puts "created #{Cocktail.all.count} cocktails with #{Dose.all.count} doses in total!"


