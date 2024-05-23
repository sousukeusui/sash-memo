# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 現場まとめて生成する
# 20.times do |n|
#   name = Faker::Name.name
#   address = Faker::Address.city
#   user_id = 1
#   contractor_id = 1
#   Site.create!(name: name,
#                   address: address,
#                   user_id: user_id,
#                   contractor_id: contractor_id)
# end


size = rand(1..9999)
room = Faker::House.room
kind = 'inner_sash'
site_memo = SiteMemo.create!(site_id: 10 , kind: kind)
20.times do |n|
  InnerSash.create!(width_up_size: size,
                    width_middle_size: size,
                    width_down_size: size,
                    height_left_size: size,
                    height_middle_size: size,
                    height_right_size: size,
                    width_frame_depth: size,
                    height_frame_depth: size,
                    room: room,
                    site_memo_id: site_memo.id)
end