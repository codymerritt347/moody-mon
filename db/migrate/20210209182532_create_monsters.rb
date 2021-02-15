class CreateMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :color
      t.string :favorite_food
      t.integer :level
      t.integer :exp_points
      t.references :user, foreign_key: {on_delete: :cascade}

      t.timestamps null: false
    end
  end
end