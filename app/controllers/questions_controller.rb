class QuestionsController < ApplicationController
  before_action :set_question, except: %i[index new create]
  before_action :set_quiz, only: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def index
    redirect_to @quiz
    # links = @quiz.questions.map do |question|
    #   "<div><a href='#{question_path(question)}'>#{question.body}</a></div><br>"
    # end
    # render html: links.join('').html_safe
  end

  def new
    @question = @quiz.questions.new
  end

  def create
    @question = @quiz.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to quiz_questions_path(@question.quiz)
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render html: '<b>Record was not found!</b>'.html_safe, status: 404
  end
end
