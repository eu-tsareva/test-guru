class Admin::QuizzesController < Admin::BaseController
  before_action :set_quiz, only: %i[show edit update destroy start]

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = current_user.created_quizzes.new(quiz_params)
    if @quiz.save
      redirect_to admin_quiz_path(@quiz)
    else
      render :new
    end
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to admin_quiz_path(@quiz)
    else
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to admin_quizzes_path
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :level, :category_id, :creator_id)
  end
end