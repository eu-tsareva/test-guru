class CreateQuizzesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes_users, id: false do |t|
      t.references :user, foreign_key: true
      t.references :quiz, foreign_key: true
    end
  end
end
