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
    gist_service = GistQuestionService.new(@quiz_passage.current_question)
    response = gist_service.call

    if gist_service.success?
      current_user.gists.create(question_id: @quiz_passage.current_question.id, url: response.html_url)
      flash_msg = { notice: view_context.link_to('Gist URL', response.html_url, target: :_blank) }
    else
      flash_msg = { alert: 'There was an error!' }
    end

    redirect_to @quiz_passage, flash_msg
  end

  private

  def set_quiz_passage
    @quiz_passage = QuizPassage.find(params[:id])
  end
end
