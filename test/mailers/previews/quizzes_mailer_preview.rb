# Preview all emails at http://localhost:3000/rails/mailers/quizzes_mailer
class QuizzesMailerPreview < ActionMailer::Preview
  def completed_quiz
    quiz_passage = QuizPassage.new(user: User.first, quiz: Quiz.first)
    QuizzesMailer.completed_quiz(quiz_passage)
  end
end
