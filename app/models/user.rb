class User < ApplicationRecord
  has_many :created_quizzes, class_name: 'Quiz', foreign_key: :creator_id
  has_and_belongs_to_many :quizzes

  def quizzes_by_level(level)
    quizzes.where(level: level)
  end
end
