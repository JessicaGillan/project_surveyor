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

N = 10

puts "Creating Question Types"

q_types = ["Multiple Choice", "Multiple Select"]
q_types.each do |t|
  QuestionType.create( name: t )
end

puts "Creating Surveys"

N.times do
  Survey.create( title: Faker::Company.name, description: Faker::Company.catch_phrase)
end

Survey.all.each do |s|
  N.times do
    s.questions << Question.create( body: Faker::Company.catch_phrase )
  end

  s.questions.each do |q|
    4.times do
      q.options << Option.create( body: Faker::Company.buzzword )
    end
  end
end

puts "Database Seeded."
