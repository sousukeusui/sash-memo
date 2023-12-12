# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 現場まとめて生成する
50.times do |n|
  name = Faker::Name.name
  address = Faker::Address.city
  user_id = 22
  contractor_id = rand(1..5)
  Site.create!(name:  name,
                  address: address,
                  user_id: user_id,
                  contractor_id: contractor_id)
end