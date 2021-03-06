# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Create Admin"
User.create(email: "admin1@gmail.com",password: "123456", admin: "true")
User.create(email: "admin2@gmail.com",password: "123456", admin: "true")
puts "Create Admin success!!!"

puts "Create User"
User.create(email: "user1@gmail.com",password: "123456")
User.create(email: "user2@gmail.com",password: "123456")
User.create(email: "user3@gmail.com",password: "123456")
User.create(email: "user4@gmail.com",password: "123456")
User.create(email: "user5@gmail.com",password: "123456")
User.create(email: "user6@gmail.com",password: "123456")
puts "Create User success!!"
