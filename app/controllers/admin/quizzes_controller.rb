class Admin::QuizzesController < Admin::BaseController
  before_action :set_quiz, only: %i[show edit update destroy start]

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.creator = current_user
    if @quiz.save
      redirect_to @quiz
    else
      render :new
    end
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to @quiz
    else
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path
  end

  def start
    current_user.quizzes.push(@quiz)
    redirect_to current_user.quiz_passage(@quiz)
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :level, :category_id, :creator_id)
  end
end
