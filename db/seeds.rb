# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# test data
answers_list = [
    [true, 1],
    [false, 2],
    [true, 3],
    [false, 4],
    [true, 5]
]
categories_list = %w( Fronted Backend Mobile )
questions_list = [
    ['Ruby creation date?', 3],
    ['Swift creation date?', 4],
    ['Ruby concept?', 5],
    ['Swift concept', 5],
    ['Ruby web framework?', 3]
]
tests_list = [
    [ 'Ruby', 1, 2 ],
    [ 'Angular', 1, 1],
    [ 'Ruby on Rails', 2, 2],
    [ 'Swift deep learning', 3, 3],
    [ 'Swift for pro', 3, 3]
]
users_list = %w( Daniyar Serik Zarina John)

# create data in db
answers_list.each do |type, question_id|
  Answer.create correct: type, question_id: question_id
end

categories_list.each { |title| Category.create title: title }

questions_list.each do |body, test_id|
  Question.create body: body, test_id: test_id
end

tests_list.each do |title, level, category_id|
  Test.create title: title, level: level, category_id: category_id
end

users_list.each { |name| User.create name: name }
