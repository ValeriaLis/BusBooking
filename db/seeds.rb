# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Ticket.destroy_all

15.times do |index|
  Ticket.create!(company: Faker::Company.name,
                 departure: Faker::Time.forward(days: 60, format: :long),
                 from: Faker::Address.city,
                 to: Faker::Address.city,
                 num_max: Faker::Number.within(range: 1..20))
end
# Add some tickets up to 1h to the departure, with a small number of tickets so # it's easy to test
Ticket.create!([{
                  company: 'Flixbus',
                  departure: 180.minutes.from_now,
                  from: 'Zagreb',
                  to: 'Prague',
                  num_max: 2
                }])

Ticket.create!([{
                  company: 'Flixbus',
                  departure: 122.minutes.from_now,
                  from: 'Zagreb',
                  to: 'Prague',
                  num_max: 2
                }])
Ticket.create!([{
                  company: 'Test',
                  departure: 200.minutes.from_now,
                  from: 'Norway',
                  to: 'Sweden',
                  num_max: 2
                }])
Ticket.create!([{
                  company: 'Test',
                  departure: Faker::Time.forward(days: 60, format: :long),
                  from: 'Norway',
                  to: 'Sweden',
                  num_max: 5
                }])
Ticket.create!([{
                  company: 'Test',
                  departure: Faker::Time.forward(days: 60, format: :long),
                  from: 'Norway',
                  to: 'Sweden',
                  num_max: 12
                }])
p "Created #{Ticket.count} tickets"

User.destroy_all
User.create([{email: 'test@test.com', password: 'password'}])
p "Created #{User.count} users"

Booking.destroy_all
p "Bookings: #{Booking.count}"