class AddPassedToQuizPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :quiz_passages, :passed, :boolean, default: false
  end
end
