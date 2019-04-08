class User < ApplicationRecord
  has_many :created_quizzes, class_name: 'Quiz', foreign_key: :creator_id
  has_many :quiz_passages
  has_many :quizzes, through: :quiz_passages

  has_secure_password

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def quizzes_by_level(level)
    quizzes.where(level: level)
  end

  def quiz_passage(quiz)
    quiz_passages.order(id: :desc).find_by(quiz_id: quiz.id)
  end

end
