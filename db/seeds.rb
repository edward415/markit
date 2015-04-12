require 'faker'

10.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
    user.skip_confirmation!
    user.save!
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
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
)
admin.skip_confirmation!
admin.save!
 
 # Create a member
member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)
member.skip_confirmation!
member.save!

puts "Done Seeding"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"