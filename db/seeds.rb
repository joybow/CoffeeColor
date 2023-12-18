# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  postal_code: "466-0044",
  address: "名古屋市中区",
  phone: "0800000000",
  is_roaster: "customer",                   
  local: "長崎県",
  name: "永田一路",
  email: "test@test.com",
  password: "Nj99159498",
  password_confirmation: "Nj99159498"
)
User.create!(
  postal_code: "466-0045",
  address: "名古屋市錦",
  phone: "0800000001",
  is_roaster: "maker",                   
  local: "長野県",
  name: "永田楓",
  email: "test1@test1.com",
  password: "Nj99159498",
  password_confirmation: "Nj99159498"
)