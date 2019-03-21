class Answer < ApplicationRecord
  MAX_ANSWERS = 4

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_number

  private

  def validate_max_number
    return if question.answers.count < MAX_ANSWERS

    errors.add(:base, "Question should have up to #{MAX_ANSWERS} answers")
  end
end
