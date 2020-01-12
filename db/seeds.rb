# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# test data
questions_list = [
    'Ruby creation date?',
    'Swift creation date?',
    'Ruby concept?',
    'Swift concept',
    'Ruby web framework?'
]
questions = []

tests_list = [
    [ 'Ruby', 1],
    [ 'Angular', 1],
    [ 'Ruby on Rails beginner', 1],
    [ 'Ruby on Rails advanced', 2],
    [ 'Ruby on Rails for pro', 5],
    [ 'Swift deep learning', 4],
    [ 'Swift for pro', 5]
]
tests = []

users_list = %w( Daniyar Serik Zarina John)
users = []

categories_list = %w( Frontend Backend Mobile )
categories = []

# create data in db
users_list.each do |name|
 users << User.create(name: name)
end

categories_list.each do |title|
  categories << Category.create(title: title)
end

tests_list.each do |title, level|
 tests << Test.create(
            title: title,
            level: level,
            category_id: categories.sample.id,
            user_id: users.sample.id
          )
end

questions_list.each do |body|
  questions << Question.create(body: body, test_id: tests.sample.id)
end

rand(3..5).times do
  Answer.create correct: [ true, false ].sample, question_id: questions.sample.id
end

rand(4..7).times do
  Certification.create test_id: tests.sample.id, user_id: users.sample.id
end
