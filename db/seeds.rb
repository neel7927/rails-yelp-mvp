# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb

require 'faker'

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

5.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
puts "created restaurants"

puts "Creating reviews ......"
  rand(10..20).times do
    review = Review.create(
      content: Faker::Restaurant.review,
      rating: rand(1..5),
      restaurant_id: restaurant.id
    )
  end
end

puts "Finished!"
