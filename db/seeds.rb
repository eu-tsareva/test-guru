# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = Category.create([
  { title: 'Frontend' },
  { title: 'Backend' },
  { title: 'Machine Learning' },
  { title: 'Mobile Development' }
])

quizzes = Quiz.create([
  { title: 'HTML', category_id: categories[0].id, level: 0 },
  { title: 'CSS', category_id: categories[0].id, level: 0 },
  { title: 'JS', category_id: categories[0].id, level: 1 },
  { title: 'Ruby', category_id: categories[1].id, level: 1 },
  { title: 'Ruby on Rails', category_id: categories[1].id, level: 2 },
  { title: 'Python', category_id: categories[2].id, level: 1 },
  { title: 'Android', category_id: categories[3].id, level: 2 }
])

questions = Question.create([
  { body: 'What does HTML stand for?', quiz_id: quizzes[0].id },
  { body: 'What does CSS stand for?', quiz_id: quizzes[1].id },
  { body: 'Inside which HTML element do we put the JavaScript?', quiz_id: quizzes[2].id },
  { body: 'How do you insert COMMENTS in Python code?', quiz_id: quizzes[5].id }
])

Answer.create([
  { body: 'Hare Tiger Moose Lion', question_id: questions[0].id, correct: false },
  { body: 'Cake Spagetti Soup', question_id: questions[1].id, correct: false },
  { body: '<js>', question_id: questions[2].id, correct: false },
  { body: '#This is a comment', question_id: questions[3].id, correct: true }
])

User.create([
  { name: 'Bob', email: 'Bob@email.com' },
  { name: 'Alice', email: 'Alice@email.com' },
  { name: 'Jane', email: 'Jane@email.com' },
  { name: 'Tim', email: 'Tim@email.com' }
])

User.first.quizzes = quizzes[0..3]
User.second.quizzes = quizzes
