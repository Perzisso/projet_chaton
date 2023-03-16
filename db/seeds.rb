# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
# Créer des utilisateurs
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    street: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end
puts "User succes"
# Créer des articles
20.times do
  Item.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Commerce.price(range: 0..100.0),
    image_url: "https://source.unsplash.com/300x300/?kitten"
  )
end
puts "Item succes"

# Créer des paniers
10.times do
  Cart.create!
end


puts "Cart succes"
# Créer des commandes
10.times do
  Order.create!(
    user_id: User.all.sample.id,
    item_id: Item.all.sample.id,
    cart_id: Cart.all.sample.id,
    purchase_number: Faker::Alphanumeric.alpha(number: 10),
    quantity: rand(1..3)
  )
end
puts "Order succes"