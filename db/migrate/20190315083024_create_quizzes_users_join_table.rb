class CreateQuizzesUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :quizzes, :users do |t|
      # t.index [:quiz_id, :user_id]
      t.index [:user_id, :quiz_id], unique: true
    end
  end
end
