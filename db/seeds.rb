# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

customer_params = []
100.times do
  customer_params << { name: Faker::Name.unique.name, email: Faker::Internet.email }
end

customers = Customer.create(
  customer_params
)
customers.first(20).each do |customer|
  Dog.create(name: Faker::Creature::Dog.name, breed: Faker::Creature::Dog.breed, days_of_week: %w[Monday Tuesday Wednesday Thursday Friday], time_period: %w[am pm], customer: customer)
end

customers[21..50].each do |customer|
  Dog.create(name: Faker::Creature::Dog.name, breed: Faker::Creature::Dog.breed, days_of_week: %w[Monday Wednesday Friday], time_period: %w[am], customer: customer)
end

customers[51..75].each do |customer|
  Dog.create(name: Faker::Creature::Dog.name, breed: Faker::Creature::Dog.breed, days_of_week: %w[Tuesday Thursday], time_period: %w[pm], customer: customer)
end

customers[76..99].each do |customer|
  Dog.create(name: Faker::Creature::Dog.name, breed: Faker::Creature::Dog.breed, days_of_week: %w[Monday], time_period: %w[am pm], customer: customer)
end