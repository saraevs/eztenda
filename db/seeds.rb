# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'date'

categories = ['Beer', 'Cider', 'White Wine', 'Red Wine', 'Champagne', 'Soft Drinks', 'Spirits']

puts 'creating testing users'

harry = User.create({
  name: 'Harry',
  email: 'harry@example.com',
  is_venue: false,
  password: 'test123',
  password_confirmation: 'test123',
  phone_number: '0123456789',
  address: Faker::Address.full_address
})
puts "created #{harry.name} with password: #{harry.password}"

jack = User.create({
  name: 'Jack Daniels',
  email: 'jack@example.com',
  is_venue: true,
  password: 'test123',
  password_confirmation: 'test123',
  phone_number: '0123456789',
  address: Faker::Address.full_address
})
puts "created #{jack.name} with password: #{jack.password}"

puts 'creating products...'

10.times do
  Product.create(
  name: Faker::Beer.name,
  category: 'Beer'
  )
end

puts 'creating venues...'

4.times do |i|
  user = User.create(
    name: Faker::Restaurant.name,
    is_venue: true,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    phone_number: '0123456789',
    password: 'Password1'
    )
end

puts 'creating brands...'

4.times do |i|
  User.create(
    name: Faker::Beer.brand,
    is_venue: false,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    phone_number: '0123456789',
    password: 'Password1'
    )
end

puts 'creating listing deals...'

5.times do
  ListingDeal.create(
    min_amount: rand(100..500),
    start_date: Date.today,
    end_date: Date.today + 90,
    volume: '12 barrels',
    product_id: rand(1..10),
    user_id: rand(1..4),
    category: categories.sample()
    )
end

puts '...'

5.times do
  ListingDeal.create(
    min_amount: rand(100..500),
    start_date: Date.today,
    end_date: Date.today + 90,
    volume: '12 barrels',
    product_id: rand(1..10),
    user_id: rand(1..4),
    category: categories.sample()
    )
end

puts 'creating bids...'

counter = 0

description = [
  "Branded glasses",
  "Branded tshirts",
  "£200 of free stock",
  "Another £200 if you sell over 500 bottles",
  "Our very own branded glasses",
  "Free merchandise",
  "We can discuss some other perks",
  "Free stock for employees",
  "We'll throw in some free mixers as well!",
  "If you sell as much as expected, we will throw in another £400"

]


10.times do
  Bid.create!({
    product_id: rand(1..10),
    user_id: rand(5..8),
    listing_deal_id: rand(1..5),
    amount: rand(500..1000),
    description: "#{description[counter]}"
    })
  counter += 1
end
