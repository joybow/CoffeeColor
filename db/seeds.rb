# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(
#   postal_code: "466-0044",
#   address: "名古屋市",
#   phone: "0800000001",
#   is_roaster: "maker",                   
#   local: "長野県",
#   name: "永田楓",
#   email: "juntwolead2@gmail.com",
#   password: "Nj99159498",
#   password_confirmation: "Nj99159498"
# )
# Admin.create!(                 
  
#   name: "永田楓",
#   email: "juntwolead2@gmail.com",
#   password: "Nj99159498",
#   password_confirmation: "Nj99159498"
# )
Tag.create([
  {name: '永田珈琲店'},
  {name: 'ブルーコーヒー'},
  {name: 'CoffeeColor'},
  {name: 'マキタコーヒー'},
  {name: 'REZZCoffee'},
  {name: 'Lit Coffee'}
])