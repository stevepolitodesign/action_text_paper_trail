# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "\n== Seeding database =="
Message.destroy_all
message = Message.create!(content: "Version 1")
message.update!(content: "Version 2")
puts "\n== Seeding database complete =="
