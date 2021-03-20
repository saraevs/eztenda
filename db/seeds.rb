# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'date'



puts 'creating products...'

10.times do
  Product.create(
  name: Faker::Beer.name,
  category: 'Beer'
  )
end

puts 'creating venues...'

4.times do |i|
  User.create(
    name: Faker::Restaurant.name,
    is_venue: true,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
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
    user_id: rand(1..4)
    )
end

puts 'creating bids...'

10.times do
  Bid.create(
    product_id: rand(1..10),
    user_id: rand(5..8),
    listing_deal_id: rand(1..5),
    amount: rand(500..1000)
    )
end
