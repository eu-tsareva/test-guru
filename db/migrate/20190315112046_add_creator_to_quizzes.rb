class AddCreatorToQuizzes < ActiveRecord::Migration[5.2]
  def change
    add_reference :quizzes, :creator, foreign_key: true
  end
end
