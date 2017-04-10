# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

products = Product.create([{ name: "Spice Cake", unit_price_in_cents: 2200,}, { name: "Pullman Loaf", unit_price_in_cents: 800 }, { name: "Muffin", unit_price_in_cents: 300 }, { name: "Avocado Cake", unit_price_in_cents: 3800 }, {
  name: "Whoopie Pie", unit_price_in_cents: 300 }])

staff_members = StaffMember.create!([
  { name: "Molly", user: User.create(email: "molly@stoopler.com", password: "password", password_confirmation: "password") },
  { name: "James", user: User.create(email: "james@webb.com", password: "password", password_confirmation: "password") },
  { name: "Robby", user: User.create(email: "robby@dore.com", password: "password", password_confirmation: "password")},
  { name: "Russell", user: User.create(email: "russell@osborne.com", password: "password", password_confirmation: "password") }
]
)
