# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
Faker::Config.locale = 'fr'

User.destroy_all
Gossip.destroy_all
Tag.destroy_all
City.destroy_all


10.times do 
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip
  )
end

10.times do 
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 5),
    email: Faker::Internet.email,
    age: Faker::Number.within(range: 18..65),
    #city: City.all.sample
  )
end

20.times do 
  Gossip.create!(
    title: Faker::Book.title,
    content: Faker::Quote.matz,
    user: User.all.sample
  )
end

10.times do
  Tag.create!(
    title: Faker::Book.genre 
  )
end

Gossip.all.each do |gossip|
  rand(1..5).times do 
    GossipTag.create!(
      gossip: gossip,
      tag: Tag.all.sample
    )
  end
end

User.all.each do |user|
  rand(1..5).times do
    recipient = User.where.not(id: user.id).sample
    PrivateMessage.create!(
      content: Faker::Quote.matz,
      sender: user,
      recipient: recipient
    )
  end
end

20.times do 
  Comment.create!(
  content: Faker::Quote.matz,
    user: User.all.sample,
    gossip: Gossip.all.sample
  )
end

20.times do
  user = User.all.sample 
  likable = [Gossip, Comment].sample.all.sample 

  Like.create(user: user, likable: likable)
end