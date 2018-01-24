require 'faker'

User.destroy_all

# Create Users
10.times do
  user = User.new(
    # name:      Faker::Name.name,
    email:     Faker::Internet.email,
    password: 'helloworld'
    )
  
  user.save!
end


# # Create member user
# member = User.new(
# #   name:       'Member User',
#   email:      'member@example.com',
#   password:   'helloworld',
#   )
# member.skip_confirmation!
# member.save!

users = User.all

puts "#{User.count} users created."

# Create Wikis
users.each do |user|
  user.wikis.create!(
    title:    Faker::Lorem.word,
    body:     Faker::Lorem.paragraph,
    private:  false
  )
end

Wikis = Wiki.all

puts "#{Wiki.count} posts created"

puts "Seed finished"