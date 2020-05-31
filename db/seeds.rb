# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create main users
User.create!( name:"RAD",
              email:"RAD@RAD.com",
              mobile:"0412345678",
              password:"Rails2020",
              city:"Melbourne",
              # avatar: File.open(Rails.root.join('public','images','users','rails.png')
            )


User.create!( name:"Melvin H",
              email:"mel@mel.com",
              mobile:"0423900100",
              password:"melvinrails",
              city:"Malaysia")
User.create!( name:"LJ Wang",
              email:"lew@lew.com",
              mobile:"0409080706",
              password:"junwangrails",
              city:"Korea")

# Generate dummy users
9.times do |n|
  name      = Faker::Name.name
  email     = "example-#{n+1}@example.com"
  mobile    = "0411223344"
  password  = "rails2020"

  User.create!(  name:      name,
                 email:     email,
                 mobile:    mobile,
                 password:  password)
end

# Create main topics
Topic.create!(name:"RMIT")
Topic.create!(name:"Game")
Topic.create!(name:"V.R.")
Topic.create!(name:"A.I.")

# Create welcome post
Post.create!( title:  "Hello World",
              content:  "Welcome to News+",
              user_id:  1,
              topic_id: 1,)

# Generate dummy posts
5.times do |n|
  title     = Faker::Game.title
  content   = Faker::Lorem.sentence(word_count: 100)
  user_id   = 2
  topic_id  = 2

  Post.create!( title:    title,
                content:  content,
                user_id:  user_id,
                topic_id: topic_id
              )
end
