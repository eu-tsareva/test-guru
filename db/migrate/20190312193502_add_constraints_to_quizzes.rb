class AddConstraintsToQuizzes < ActiveRecord::Migration[5.2]
  def change
    change_column_null :quizzes, :title, false
    change_column_null :quizzes, :level, false
  end
end
