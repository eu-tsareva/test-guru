class AddTimerToQuizzes < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :time, :integer
  end
end
