# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all

10.times do
City.create(name: Faker::Address.city)
end

15.times do
Doctor.create(
  first_name: Faker::Name.first_name, 
  last_name: Faker::Name.last_name, 
  zip_code: Faker::Address.zip_code, 
  specialty: Faker::Job.field,
  city_id: City.find(rand(City.first.id..City.last.id)).id
)
end

74.times do
Patient.create(
  first_name: Faker::Name.first_name, 
  last_name: Faker::Name.last_name, 
  city_id: City.find(rand(City.first.id..City.last.id)).id
)
end
140.times do
Appointment.create(
  date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 50), 
  doctor_id: Doctor.find(rand(Doctor.first.id..Doctor.last.id)).id, 
  patient_id: Patient.find(rand(Patient.first.id..Patient.last.id)).id,
  city_id: City.find(rand(City.first.id..City.last.id)).id
)
end