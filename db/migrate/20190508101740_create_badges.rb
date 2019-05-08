class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.references :rule, foreign_key: true

      t.timestamps
    end
  end
end
