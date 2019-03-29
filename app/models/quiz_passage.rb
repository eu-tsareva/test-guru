class QuizPassage < ApplicationRecord
  PASSING_SCORE = 85

  belongs_to :quiz
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def successful?
    score >= PASSING_SCORE
  end

  def score
    @score ||= (correct_questions * 100.0 / quiz.questions.count).ceil
  end

  private

  def before_validation_set_first_question
    self.current_question = quiz.questions.first if quiz.present?
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == (answer_ids.map(&:to_i).sort rescue [])
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    quiz.questions.order(:id).where('id > ?', current_question.id).first
  end
end
