require 'faker'

1.times do
  user = User.new(
  name:     'paco',
  email:    'palmtreerooskee@gmail.com',
  password: 'helloworld'
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

1.times do
  user = User.new(
    name:     'member',
    email:    'member@example.com',
    password: 'helloworld'
  )
  user.skip_confirmation!
  user.save!
end

30.times do
  Regapp.create!(
  user: users.sample,
  name: Faker::Hipster.word,
  url:  "http://#{Faker::Hipster.word}.com"
  )
end
regapps = Regapp.all

300.times do
  Event.create!(
  regapp: regapps.sample,
  name:   Faker::Hacker.noun
  )
end

puts "Seeding finished"
puts "#{User.count} users created"
puts "#{Regapp.count} regapps created"
puts "#{Event.count} events created"
