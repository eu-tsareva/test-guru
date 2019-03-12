class AddLevelDefaultToQuizzes < ActiveRecord::Migration[5.2]
  def change
    change_column_default :quizzes, :level, to: 0
  end
end
