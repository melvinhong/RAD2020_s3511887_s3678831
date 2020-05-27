# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all
# Welcome = Post.create!(title:"Welcome To News+", content:"The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog.",
#   user_id: 6, topic_id: 5)

Topic.destroy_all
RMIT = Topic.create!(name:"RMIT")
Game = Topic.create!(name:"Game")
VR = Topic.create!(name:"V.R.")
AI = Topic.create!(name:"A.I.")

User.destroy_all

# User.create!( name:"Example User",
#               email:"example@rails.com",
#               mobile:"0404040404",
#               password:"pwpwpwpw",
#               city:"Barcelona")
#
# 99.times do |n|
#   name = Faker::Name.name
#   email = "example-#{n+1}@rails.com"
#   password = "pwpwpwpw"
#   Users.create!(  name:name,
#                   email:email,
#                   mobile:mobile,
#                   password:password,
#                   city:city)

RAD  = User.create!(name:"RAD",email:"RAD@RAD.com",mobile:"0412345678",password:"Rails2020",city:"Melbourne")
Melvin = User.create!(name:"Melvin H", email:"mel@mel.com", mobile:"0423900100",password:"melvinrails", city:"Malaysia")
Lew = User.create!(name:"LJ Wang", email:"lew@lew.com", mobile:"0409080706", password:"junwangrails", city:"Korea")
SH = User.create!(name:"So Hai", email:"sohai@sohai.com", mobile:"0411223344", password:"sohairails", city:"America")
Mahai = User.create!(name:"Ma Hai", email:"mahai@mahai.com", mobile:"0411225544", password:"mahairails", city:"Canada")
