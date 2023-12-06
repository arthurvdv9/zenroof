# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Clearing db..."
Ticket.destroy_all
Room.destroy_all
House.destroy_all
User.destroy_all

puts "Creating user"
user = User.create!(first_name: "Arthur", last_name: "arthurito", email: "a.vdv@gmail.com", password: "123456")
userowner = User.create!(first_name: "Albert", last_name: "Smith", email:"owner@gmail.com", password: "123456")
usertenant = User.create!(first_name: "Isabelle", last_name: "Hamm", email:"tenant@gmail.com", password: "123456")
puts "Users Created"

puts "Creating house"
file = URI.open("https://media-resize.immowebstatic.be/classifieds/9779dd45-f992-538e-bcc7-c9ecd1c38877/736x736/86a638045445ab3227284f4bc418e03f.jpg?cache=20231107171417")
house = House.create!(address:"Rue de Piétrain 420, Hainaut, Obourg", name: "Aunt's House", capacity: 4, user_id: userowner.id)
house.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
puts "House created"

puts "Creating house"
file = URI.open("https://cf.bstatic.com/xdata/images/hotel/max1024x768/303315943.jpg?k=e8b80e6e273ab744215eb5fce6c7d0b280cb96ca7f8876d25dc040fa7e35156b&o=&hp=1")
house = House.create!(address:"Região Norte, Rua de Brito Capelo 681", name: "Beach house", capacity: 6, user_id: userowner.id)
house.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
puts "House created"

puts "Creating house"
file = URI.open("https://images.mansionglobal.com/im-47142150")
house = House.create!(address:"Aldoar, rua do Farol, 233, Foz Velha", name: "Appartment T4", capacity: 4, user_id: userowner.id)
house.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
puts "House created"

puts "Creating house"
file = URI.open("https://mediaredir2.era.pt/i/house-t2-odemira-sao-teotonio_14_1_1314347_16412635_2_1_CBI4Eylx82AlGjH6NGRdftcRI5cc4XCRUJ2HpbSaPRLEB8h4ZPpqcw%3D%3D_.jpg")
house = House.create!(address:"Travessa Monte Louro, Constituição, Porto", name: "Parents House", capacity: 2, user_id: userowner.id)
house.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
puts "House created"

puts "Creating house"
file = URI.open("https://lh3.googleusercontent.com/p/AF1QipPcfEBFRzhgbcjZvB2bBkqJii-G3QsFI6PybF4Y=s1360-w1360-h1020")
house = House.create!(address:"Great Titchfield St. London W1D 1NN, United Kingdom", name: "UK House", capacity: 20, user_id: userowner.id)
house.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
puts "House created"



puts "Creating room"
room = Room.create!(number: 1, user_id: usertenant.id, house_id: house.id)
puts "Room created"

puts "Creating room"
room = Room.create!(number: 2, user_id: usertenant.id, house_id: house.id)
puts "Room created"

puts "Creating room"
room = Room.create!(number: 3, user_id: usertenant.id, house_id: house.id)
puts "Room created"

puts "Creating room"
room = Room.create!(number: 4, user_id: usertenant.id, house_id: house.id)
puts "Room created"

puts "Creating ticket"
file = URI.open("https://images.unsplash.com/photo-1605281317010-fe5ffe798166?q=80&w=2044&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
ticket = Ticket.create!(title: "Pipe acting weird", description: "Hi, there’s some weird noises coming form the pipes... Please solve this as soon as possible. :)", status: "pending", priority: "high", room_id: usertenant.room.id)
ticket.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
ticket.save

puts "-------------- DB now Seeded ----------------"
