class QuizPassage < ApplicationRecord
  PASSING_SCORE = 75

  belongs_to :quiz
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  scope :passed, -> { where(passed: true) }

  def accept!(answer_ids)
    self.correct_questions += 1 if answer_ids && correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def successful?
    score >= PASSING_SCORE
  end

  def first_attempt?
    user
      .completed_quizzes
      .where(quizzes: { id: quiz.id })
      .count
      .equal?(1)
  end

  def score
    @score ||= (correct_questions * 100.0 / quiz.questions.count).ceil
  end

  def progress
    ((current_question.position - 1) * 100.0 / quiz.questions.count).round(1)
  end

  def time_left
    return unless quiz.time

    created_at + quiz.time * 60 - Time.current
  end

  def out_of_time
    quiz.time && time_left <= 0
  end

  private

  def before_validation_set_question
    self.current_question = next_question
    self.passed = true if successful?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    return quiz.questions.first unless current_question

    quiz.questions.order(:id).where('id > ?', current_question.id).first
  end
end
