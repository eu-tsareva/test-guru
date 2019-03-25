class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[create show destroy]

  def show

  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
