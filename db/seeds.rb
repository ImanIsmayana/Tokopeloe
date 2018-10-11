# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'lebaksari567@gmail.com', password: 'lebaksari', password_confirmation: 'lebaksari') if Rails.env.development?


Product.create!(name: 'hwad', description: 'wadwad', image: 'tiger.png', price: 3000, expire: "2020-01-12 21:01:00", store: 1)
