require 'faker'

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password_digest: Faker::Internet.password
  )
  Monster.create(
    name: Faker::Creature::Animal.name,
    user_id: Faker::Number.between(from: 1, to: 10)
    )
  Entry.create(
    title: ,
    note: ,
    user_id: Faker::Number.between(from: 1, to: 10)
  )
  Mood.create(
    name: ,
    effect: ["up", "down"].sample,
    amount: Faker::Number.between(from: 1, to: 3),
    entry_id: Faker::Number.between(from: 1, to: 10)
  )
end