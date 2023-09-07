# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

City.delete_all
Department.delete_all
Country.delete_all

america_countries = [
  "United States",
  "Colombia",
]

america_countries.each do |country_name|
  Country.create(name: country_name)
end

united_states = Country.find_by(name: "United States")
united_states.departments.create([
  { name: "New York" },
  { name: "Los Angeles" }
])


ny = united_states = Department.find_by(name: "New York")
ny.cities.create([
  { name: "Manhatan" },
  { name: "Queens" }
])

la = united_states = Department.find_by(name: "Los Angeles")
la.cities.create([
  { name: "Orange" },
  { name: "Ventura" }
])


united_states = Country.find_by(name: "Colombia")
united_states.departments.create([
  { name: "Cundinamarca" },
  { name: "Antioquia" }
])


cundi = united_states = Department.find_by(name: "Cundinamarca")
cundi.cities.create([
  { name: "Bogota" },
  { name: "Funza" }
])

anti = united_states = Department.find_by(name: "Antioquia")
anti.cities.create([
  { name: "Envigado" },
  { name: "Medellín" }
])
