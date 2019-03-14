class User < ApplicationRecord
  has_and_belongs_to_many :quizzes

  def quizzes_by_level(level)
    quizzes.where(level: level)
  end
end
