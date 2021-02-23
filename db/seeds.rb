# require 'pry'
# require 'faker'

# counter = 0
# 10.times do
#   counter += 1
#   User.create(
#     email: Faker::Internet.email,
#     password: Faker::Internet.password,
#     name: Faker::Name.first_name,
#     favorite_color: ["red", "orange", "yellow", "green", "blue", "purple"].sample,
#     favorite_food: Faker::Food.dish
#   )
#   Monster.create(
#     name: Faker::Games::Pokemon.name,
#     user_id: counter
#     )
#   Entry.create(
#     time_of_day: ["morning", "day", "night"].sample,
#     feeling: ["happy", "excited", "surprised", "sad", "angry", "sick", "annoyed", "scared", "shame", "anxious"].sample,
#     intensity: rand(1..10),
#     situation: Faker::Lorem.sentences(number: 1),
#     user_id: counter
#   )
# end