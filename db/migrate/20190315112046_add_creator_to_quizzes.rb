class AddCreatorToQuizzes < ActiveRecord::Migration[5.2]
  def change
    add_reference :quizzes, :creator, index: true
    add_foreign_key :quizzes, :users, column: :creator_id
  end
end
