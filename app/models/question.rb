class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers

  validates :body, presence: true
  validate :validate_answers

  private

  def validate_answers
    return if answers.count.between?(1, 4)

    errors.add(:base, 'Should have from 1 to 4 answers')
  end
end
