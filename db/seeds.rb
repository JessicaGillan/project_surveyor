# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying database."

Survey.destroy_all
QuestionType.destroy_all

MULTIPLIER = 10

puts "Creating Question Types"

q_types = ["Multiple Choice"]
q_types.each do |t|
  QuestionType.create( name: t )
end

puts "Database Seeded."
