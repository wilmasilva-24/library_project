# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: 'Infantil')
Category.create(name: 'Aventura')
Category.create(name: 'Juvenil')

User.create(name:"user", email:"user@teste.com", password: "12345", permission:"common")
User.create(name:"Admin", email:"admin@test.com", password:"12345", permission:"admin")