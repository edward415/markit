require 'faker'

10.times do
  User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
end

users = User.all

50.times do
  Topic.create!(
    title: Faker::Lorem.word,
    user: users.sample
  )
end

topics = Topic.all

350.times do
  Bookmark.create!(
    url: Faker::Internet.domain_name,
    topic: topics.sample,
    user: users.sample
  )
end


puts "Done Seeding"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"