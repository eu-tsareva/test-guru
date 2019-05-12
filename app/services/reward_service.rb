class RewardService
  def initialize(current_user)
    @current_user = current_user
  end

  def call
    Badge.find_each do |badge|
      if send "#{badge.rule.attr}_condition_satisfied?", badge.rule.value
        @current_user.badges << badge
      end
    end
  end

  private

  def level_condition_satisfied?(level)
    quizzes_passed =
      QuizPassage
      .includes(:quiz)
      .where(user_id: @current_user.id, current_question_id: nil)
      .where(quizzes: { level: level })
      .select(&:successful?)
      .pluck(:quiz_id)
      .sort
      .uniq
    quizzes_passed == Quiz.where(level: level).order(:id).pluck(:id)
  end

  def category_condition_satisfied?(category)
    quizzes_passed =
      QuizPassage
      .includes(:quiz)
      .where(user_id: @current_user.id, current_question_id: nil)
      .where(quizzes: { category_id: category })
      .select(&:successful?)
      .pluck(:quiz_id)
      .sort
      .uniq
    quizzes_passed == Quiz.where(category_id: category).order(:id).pluck(:id)
  end

  def score_condition_satisfied?(score)
    quizzes_passed =
      QuizPassage
      .where(user_id: @current_user.id, current_question_id: nil)
      .select { |qp| qp.score.to_i >= score.to_i }
      .pluck(:quiz_id)
      .sort
      .uniq
    quizzes_passed == Quiz.all.order(:id).pluck(:id)
  end

  def attempts_condition_satisfied?(attempts)
    quizzes_passed =
      QuizPassage
      .includes(:quiz)
      .where(user_id: @current_user.id, current_question_id: nil)
      .order(:created_at)
      .group_by(&:quiz_id)
      .select do |_q_id, q_passages|
        index = q_passages.index(&:successful?)
        !index.nil? && index < attempts.to_i
      end
      .keys
      .sort
    p quizzes_passed
    quizzes_passed == Quiz.all.order(:id).pluck(:id)
  end

end
