require 'faker'

counter = 0
10.times do
  counter += 1
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    hometown: Faker::Books::Dune.planet,
    favorite_food: Faker::Food.dish
  )
  Monster.create(
    name: Faker::Games::Pokemon.name,
    level: 0,
    current_health: 10,
    max_health: 10,
    user_id: counter
    )
  Entry.create(
    title: Faker::Lorem.sentence(word_count: 3),
    note: Faker::Lorem.sentences(number: 3),
    user_id: counter
  )
  Mood.create(
    name: Faker::Color.color_name,
    effect: ["up", "down"].sample,
    amount: Faker::Number.between(from: 1, to: 3),
    entry_id: counter
  )
end