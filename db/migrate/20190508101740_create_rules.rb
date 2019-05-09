class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :attr, null: false
      t.string :value, null: false
      t.references :badge, foreign_key: true

      t.timestamps
    end
  end
end
