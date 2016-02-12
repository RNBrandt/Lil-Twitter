require 'faker'

15.times do |n|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::Hipster.paragraph(1),
    email: Faker::Internet.email,
    password: 'a',
    handle: Faker::Team.name)
  end


150.times do |n|
  Tweet.create(post: Faker::Hipster.sentence(1), user: (User.all).sample)
end


