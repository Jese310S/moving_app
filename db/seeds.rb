# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create a main sample user.
User.create!(name: "Example User",
            email: "example@gmail.com",
            password: "foobar",
            password_confirmation: "foobar")

# Generate a bunch of additional users.
10.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@gmail.com"
    password = "password"
    User.create!(name: name,
            email: email,
            password: password,
            password_confirmation: password)
end

# #create listings faker data
# 10.times do
#     Listing.create(
#     title: Faker::Lorem.sentence(word_count: 3),
#     moving_date: Faker::Date.between(from: '2020-08-23', to: '2020-12-25'),
#     moving_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
#     price: Faker::Food.dish,
#     image: Faker::LoremPixel.image,
#     comment:Faker::Lorem.sentence(word_count: 5)
#     )
# end

#generate listings comment for a subset of users
users = User.order(:created_at).take(6)
3.times do
comment = Faker::Lorem.sentence(word_count: 5)
users.each { |user| user.listings.create!(comment: comment) }
end


