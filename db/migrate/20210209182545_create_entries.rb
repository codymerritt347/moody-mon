class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :time_of_day
      t.string :feeling
      t.string :situation
      t.integer :intensity
      t.boolean :breathe_together
      t.references :user, foreign_key: {on_delete: :cascade}

      t.timestamps null: false
    end
  end
end
