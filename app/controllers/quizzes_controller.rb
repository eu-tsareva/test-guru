class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[start]

  def index
    @quizzes = Quiz.all
  end

  def start
    current_user.quizzes.push(@quiz)
    redirect_to current_user.quiz_passage(@quiz)
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
