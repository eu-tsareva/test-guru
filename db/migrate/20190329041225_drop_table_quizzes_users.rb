class DropTableQuizzesUsers < ActiveRecord::Migration[5.2]
  def up
    drop_table :quizzes_users, if_exists: true
  end
end