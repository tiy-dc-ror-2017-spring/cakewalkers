# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = Product.create([{ name: "Spice Cake", unit_price_in_cents: 2200,}, { name: "Pullman Loaf", unit_price_in_cents: 800 }, { name: "Muffin", unit_price_in_cents: 300 }, { name: "Avocado Cake", unit_price_in_cents: 3800 }, {
  name: "Whoopie Pie", unit_price_in_cents: 300 }])
