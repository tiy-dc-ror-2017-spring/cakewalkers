# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

products = HTTParty.get("https://cakewalkers-api.herokuapp.com/products")
products.each do |product_attrs|
  product = Product.new
  product.code = product_attrs["code"]
  product.name = product_attrs["name"]
  product.save
end

staff_members = StaffMember.create!([
  { name: "Molly", user: User.create(email: "molly@stoopler.com", password: "password", password_confirmation: "password") },
  { name: "James", user: User.create(email: "james@webb.com", password: "password", password_confirmation: "password") },
  { name: "Robby", user: User.create(email: "robby@dore.com", password: "password", password_confirmation: "password")},
  { name: "Russell", user: User.create(email: "russell@osborne.com", password: "password", password_confirmation: "password") }
]
)
