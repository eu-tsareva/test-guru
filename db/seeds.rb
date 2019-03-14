# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create([
  { title: 'Frontend' },
  { title: 'Backend'},
  { title: 'Machine Learning' },
  { title: 'Mobile Development' }
])

Quiz.create([
  { title: 'HTML', category_id: 1, level: 0 },
  { title: 'CSS', category_id: 1, level: 0 },
  { title: 'JS', category_id: 1, level: 1 },
  { title: 'Ruby', category_id: 2, level: 1 },
  { title: 'Ruby on Rails', category_id: 2, level: 2 },
  { title: 'Python', category_id: 3, level: 1 },
  { title: 'Android', category_id: 4, level: 2 }
])

Question.create([
  { body: 'What does HTML stand for?', quiz_id: '1' },
  { body: 'What does CSS stand for?', quiz_id: '2' },
  { body: 'Inside which HTML element do we put the JavaScript?', quiz_id: '3' },
  { body: 'How do you insert COMMENTS in Python code?', quiz_id: '6' }
])

Answer.create([
  { body: 'Hare Tiger Moose Lion', question_id: 1, correct: false },
  { body: 'Cake Spagetti Soup', question_id: 2, correct: false },
  { body: '<js>', question_id: 3, correct: false },
  { body: '#This is a comment', question_id: 4, correct: true }
])

User.create([
  { name: 'Bob', email: 'Bob@email.com' },
  { name: 'Alice', email: 'Alice@email.com' },
  { name: 'Jane', email: 'Jane@email.com' },
  { name: 'Tim', email: 'Tim@email.com' }
])

User.first.quizzes = Quiz.order(:id).limit(3)
User.second.quizzes = Quiz.all
