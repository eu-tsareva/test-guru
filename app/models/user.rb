class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :created_quizzes, class_name: 'Quiz', foreign_key: :creator_id
  has_many :quiz_passages
  has_many :quizzes, through: :quiz_passages
  has_many :gists
  has_many :feedbacks
  has_and_belongs_to_many :badges

  def quizzes_by_level(level)
    quizzes.where(level: level)
  end

  def quiz_passage(quiz)
    quiz_passages.order(id: :desc).find_by(quiz_id: quiz.id)
  end

  def completed_quizzes
    quizzes.where(quiz_passages: { passed: true })
  end

  def admin?
    is_a?(Admin)
  end

  def name
    return 'User' unless first_name || last_name

    "#{first_name} #{last_name}"
  end
end
