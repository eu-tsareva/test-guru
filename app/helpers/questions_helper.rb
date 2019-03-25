module QuestionsHelper
  TITLES = { 'new' => 'Create new', 'edit' => 'Edit' }.freeze

  def form_header(question)
    "#{TITLES[action_name]} #{question.quiz.title} question"
  end
end
