class QuestionsController < ApplicationController
  before_action :set_question, except: %i[index new create]
  before_action :set_quiz, only: %i[index destroy]

  def index
    render plain: @quiz.questions.map(&:body).join("\n")
  end

  def show
    render plain: @question.body
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
    @question.destroy
    redirect_to quiz_questions_path(@quiz)
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
end
