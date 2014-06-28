# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
(1..100).each do |i|
  u = User.create(
  	name: Faker::Japanese::Name.name,
    email: "junwako@gmail.com",
    zipcode: "9791751",
    address: "福島県双葉郡浪江町1-1-#{i}",
    old_address: "福島県双葉郡浪江町100-1-#{i}"
  )
end