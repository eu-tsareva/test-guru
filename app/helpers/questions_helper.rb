module QuestionsHelper
  def form_header(question)
    title = question.new_record? ? 'Create new' : 'Edit'
    "#{title} #{question.quiz.title} question"
  end
end
