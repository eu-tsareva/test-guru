class QuestionsController < ApplicationController
  before_action :set_question, except: %i[index new create]
  before_action :set_quiz, only: :index

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def index
    links = @quiz.questions.map do |question|
      "<div><a href='#{question_path(question)}'>#{question.body}</a></div><br>"
    end
    render html: links.join('').html_safe
  end

  def create
    question = Question.new(question_params)
    if question.save
      redirect_to question
    else
      render :new
    end
  end

  def destroy
    quiz = @question.quiz
    @question.destroy
    redirect_to quiz_questions_path(quiz)
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def question_params
    params.require(:question).permit(:quiz_id, :body)
  end

  def rescue_with_question_not_found
    render html: '<b>Record was not found!</b>'.html_safe
  end
end
