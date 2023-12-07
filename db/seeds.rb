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
usertenant1 = User.create!(first_name: "Isabelle", last_name: "Hamm", email:"tenant@gmail.com", password: "123456")
usertenant2 = User.create!(first_name: "João", last_name: "Martins", email:"joaomartins@gmail.com", password: "123456")
usertenant3 = User.create!(first_name: "Francisco", last_name: "Le Wagon", email:"franciscolw@gmail.com", password: "123456")
usertenant4 = User.create!(first_name: "Carlos", last_name: "Rabbit", email:"carlosrabbit@gmail.com", password: "123456")
usertenant5 = User.create!(first_name: "Vasco", last_name: "Pereira", email:"vasco@gmail.com", password: "123456")
usertenant6 = User.create!(first_name: "Joana", last_name: "Jojojojo", email:"joana@gmail.com", password: "123456")
usertenant7 = User.create!(first_name: "Mariana", last_name: "Miragaia", email:"mariana@gmail.com", password: "123456")
usertenant8 = User.create!(first_name: "Isabelle", last_name: "Ferrier", email:"diogo@gmail.com", password: "123456")
usertenant9 = User.create!(first_name: "Pete", last_name: "Davidson", email:"pete@gmail.com", password: "123456")


puts "Users Created"

puts "Creating house"
file = URI.open("https://media-resize.immowebstatic.be/classifieds/9779dd45-f992-538e-bcc7-c9ecd1c38877/736x736/86a638045445ab3227284f4bc418e03f.jpg?cache=20231107171417")
house1 = House.create!(address:"Rue de Piétrain 420, Hainaut, Obourg", name: "Aunt's House", capacity: 4, user_id: userowner.id)
house1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
puts "House created"

puts "Creating house"
file = URI.open("https://cf.bstatic.com/xdata/images/hotel/max1024x768/303315943.jpg?k=e8b80e6e273ab744215eb5fce6c7d0b280cb96ca7f8876d25dc040fa7e35156b&o=&hp=1")
house2 = House.create!(address:"Região Norte, Rua de Brito Capelo 681", name: "Beach house", capacity: 5, user_id: userowner.id)
house2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
puts "House created"

puts "Creating house"
file = URI.open("https://images.mansionglobal.com/im-47142150")
house3 = House.create!(address:"Aldoar, rua do Farol, 233, Foz Velha", name: "Appartment T4", capacity: 4, user_id: userowner.id)
house3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
puts "House created"

puts "Creating house"
file = URI.open("https://mediaredir2.era.pt/i/house-t2-odemira-sao-teotonio_14_1_1314347_16412635_2_1_CBI4Eylx82AlGjH6NGRdftcRI5cc4XCRUJ2HpbSaPRLEB8h4ZPpqcw%3D%3D_.jpg")
house4 = House.create!(address:"Travessa Monte Louro, Constituição, Porto", name: "Parents House", capacity: 2, user_id: userowner.id)
house4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
puts "House created"

puts "Creating house"
file = URI.open("https://lh3.googleusercontent.com/p/AF1QipPcfEBFRzhgbcjZvB2bBkqJii-G3QsFI6PybF4Y=s1360-w1360-h1020")
house5 = House.create!(address:"Great Titchfield St. London W1D 1NN, United Kingdom", name: "UK House", capacity: 8, user_id: userowner.id)
house5.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
puts "House created"



puts "Creating room"
room = Room.create!(number: 1, user_id: usertenant1.id, house_id: house1.id)
puts "Room created"

puts "Creating room"
room = Room.create!(number: 2, user_id: usertenant2.id, house_id: house1.id)
puts "Room created"

puts "Creating room"
room = Room.create!(number: 3, user_id: usertenant3.id, house_id: house2.id)
puts "Room created"

puts "Creating room"
room = Room.create!(number: 4, user_id: usertenant4.id, house_id: house2.id)
puts "Room created"

puts "Creating room"
room = Room.create!(number: 5, user_id: usertenant5.id, house_id: house3.id)
puts "Room created"

puts "Creating room"
room = Room.create!(number: 6, user_id: usertenant6.id, house_id: house3.id)
puts "Room created"

puts "Creating room"
room = Room.create!(number: 7, user_id: usertenant7.id, house_id: house4.id)
puts "Room created"

puts "Creating room"
room = Room.create!(number: 8, user_id: usertenant8.id, house_id: house4.id)
puts "Room created"

puts "Creating room"
room = Room.create!(number: 9, user_id: usertenant9.id, house_id: house5.id)
puts "Room created"

puts "Creating ticket"
file = URI.open("https://i.redd.it/mll2k3n2fwlb1.jpg")
ticket = Ticket.create!(title: "Boiler not working", description: "Hi, despite the buttons being turned and the light being on the boiler doesn't work... Please solve this as soon as possible. :)", status: "Pending", priority: "high", room_id: usertenant1.room.id)
ticket.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
ticket.save

puts "Creating ticket"
file = URI.open("https://www.cnet.com/a/img/resize/490349daad3802e23721c574e126b622f1eae3d0/hub/2021/04/21/671e571b-6b66-4f86-978c-8c1394a8e0a6/screen-shot-2021-04-21-at-10-31-37-am.png?auto=webp&fit=crop&height=675&width=1200")
ticket = Ticket.create!(title: "Broken pipe is leaking", description: "Greetings, the pipe broke and started to leak, we managed to temporarily fix it with some tape but i can't stress how important it is to get it fixed ASAP", status: "Pending", priority: "high", room_id: usertenant2.room.id)
ticket.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
ticket.save


puts "Creating ticket"
file = URI.open("https://i.insider.com/5c1ab3dc01c0ea1233396b64?width=700")
ticket = Ticket.create!(title: "Ceiling mold", description: "Hey! Like we've talked before the mold on the bedroom ceiling is getting worse. Could you send someone to check up on it? Thanks!", status: "Pending", priority: "Medium", room_id: usertenant3.room.id)
ticket.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
ticket.save

puts "Creating ticket"
ticket = Ticket.create!(title: "Loud neighbours", description: "Hey, i have work at around 6 am in the morning and the neighbours(2º floor) have been doing a lot of noise all night. It gets very tiring so if you could talk to them i'd appreciate it. Have a good one.", status: "Pending", priority: "Medium", room_id: usertenant3.room.id)
ticket.save

puts "Creating ticket"
file = URI.open("https://www.aborrelli.com/hubfs/white-window-type-ac-outdoor-unit-1472035.jpg")
ticket = Ticket.create!(title: "Air Conditioning", description: "Hey! I just got home and it seems like the air conditioning system stopped working, could you please check up on it?", status: "Pending", priority: "Low", room_id: usertenant4.room.id)
ticket.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
ticket.save

puts "Creating ticket"
file = URI.open("https://holeinonepest.com/wp-content/uploads/2011/12/Rats-e1400241706267.jpg")
ticket = Ticket.create!(title: "RAT INFESTATION", description: "THERES RATS EVERYWHERE SINCE I GOT HOME, PLEASE SEND SOMEONE OVER!!!!!!", status: "Pending", priority: "High", room_id: usertenant6.room.id)
ticket.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
ticket.save

puts "Creating ticket"
file = URI.open("https://media.istockphoto.com/id/1205308487/photo/mailbox-and-post-damaged-by-hurricane-michael.jpg?s=612x612&w=0&k=20&c=oODPlJIvsamaZdp9Ei4EBjTsJRUHRY7pS7IFtdsSGAQ=")
ticket = Ticket.create!(title: "Mailbox is broken", description: "I think someone broke the mailbox in the middle of the night, maybe reply to this so we can discuss our options?", status: "Pending", priority: "Medium", room_id: usertenant9.room.id)
ticket.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
ticket.save

puts "-------------- DB now Seeded ----------------"
