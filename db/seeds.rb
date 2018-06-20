# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'chesh@chesh.info', password: 'password', password_confirmation: 'password') if Rails.env.development?

Meeting.create([home_team: "Belle Vue Aces", away_team: "Rye House Rockets", date: "2018-06-20",
                home_rider_1: "Craig Cook",
                home_rider_2: "Jason Garrity",
                home_rider_3: "Dan Bewley",
                home_rider_4: "Rohan Tungate",
                home_rider_5: "Max Fricke",
                home_rider_6: "Jye Etheridge",
                home_rider_7: "Damian Drozdz",
                away_rider_1: "Krzysztof Kasprzak",
                away_rider_2: "Aaron Summers",
                away_rider_3: "Chris Harris",
                away_rider_4: "Stuart Robson",
                away_rider_5: "Scott Nicholls",
                away_rider_6: "Nikolaj Busk Jacobsen",
                away_rider_7: "Max Clegg"])




