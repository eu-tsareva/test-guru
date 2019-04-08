class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers

  validates :body, presence: true

  def position
    quiz.questions.order(:id).pluck(:id).index(id) + 1
  end
end
