class AddUniqueIndexToQuizzes < ActiveRecord::Migration[5.2]
  def change
    add_index :quizzes, [:title, :level], unique: true
  end
end
