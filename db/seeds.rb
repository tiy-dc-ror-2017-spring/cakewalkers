# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
staff_members = StaffMember.create!([
  { name: "Molly", user: User.create(email: "molly@stoopler.com", password_digest: "password") },
  { name: "James", user: User.create(email: "james@webb.com", password_digest: "password") },
  { name: "Robby", user: User.create(email: "robby@dore.com", password_digest: "password")},
  { name: "Russell", user: User.create(email: "russell@osborne.com", password_digest: "password") }
]
)
