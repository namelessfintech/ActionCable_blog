# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

50.times do |i|
  user = User.create(email: Faker::Internet.email, password: "123456")

  user.profile = Profile.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, bio: Faker::Lorem.paragraphs(4).join("\n"), user_id: user.id, avatar: Faker::Avatar.image)
end
