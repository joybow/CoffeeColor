# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.create!(
    title: 'コーヒーラブ',
    content: '美味しいコーヒー大好き',
    user_id: 1,
    )

User.create!(
  id: '3',
  name:'永田楓',                         
  postal_code: '000-001',
  address: '愛知県名古屋市昭和です',                     
  phone: '000-0000-001',
  is_roaster: 'maker',
  local: '愛知県',
  email: 'test1@test1.com',
  password: '222222',
  password_confirmation: '222222'
)

User.create!(
  id: '4',
  name:'永田一路',                         
  postal_code: '000-000',
  address: '愛知県名古屋市瑞穂区',                     
  phone: '000-0000-002',
  is_roaster: 'customer',
  local: '愛知県',
  email: 'test3@test3.com',
  password: '333333',
  password_confirmation: '333333'
)