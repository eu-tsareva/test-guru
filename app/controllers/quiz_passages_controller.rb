class QuizPassagesController < ApplicationController
  before_action :set_quiz_passage, only: %i[show update result gist]

  def show

  end

  def update
    @quiz_passage.accept!(params[:answer_ids])

    if @quiz_passage.completed?
      QuizzesMailer.completed_quiz(@quiz_passage).deliver_now
      redirect_to result_quiz_passage_path(@quiz_passage)
    else
      render :show
    end
  end

  def result

  end

  def gist
    result = GistQuestionService.new(@quiz_passage.current_question).call
    flash_options =
      if result.success?
        { notice: t('.success') }
      else
        { alert: t('.failure') }
      end
    redirect_to @quiz_passage, flash_options
  end

  private

  def set_quiz_passage
    @quiz_passage = QuizPassage.find(params[:id])
  end
end
