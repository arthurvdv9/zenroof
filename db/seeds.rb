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
user = User.create!(first_name: "Arthur", last_name: "arthurito", email:"a.vdv@gmail.com", password: "123456")
puts "User Created"

puts "Creating house"
file = URI.open("https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/home-improvement/wp-content/uploads/2022/07/download-23.jpg")
house = House.create!(address:"Rue de la paix", name: "Maison de la paix", capacity: 5, user_id: user.id)
house.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
puts "House created"

puts "Creating house"
file = URI.open("https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/home-improvement/wp-content/uploads/2022/07/download-23.jpg")
house = House.create!(address:"Porto", name: "portadsadsadsads", capacity: 10, user_id: user.id)
house.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
puts "House created"

puts "Creating room"
room = Room.create!(number: 1, user_id: user.id, house_id: house.id)
puts "Room created"

puts "Creating ticket"
file = URI.open("https://images.unsplash.com/photo-1605281317010-fe5ffe798166?q=80&w=2044&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
ticket = Ticket.create!(title:"Hello", description: "blablablabla", status: "pending", priority: "high", room_id: user.room.id)
ticket.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
ticket.save

puts "-------------- DB now Seeded ----------------"
