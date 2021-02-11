class CreateUserMoods < ActiveRecord::Migration[5.2]
  def change
    create_table :user_moods do |t|
      t.references :user_id, foreign_key: {on_delete: :cascade}
      t.references :entry_id, foreign_key: {on_delete: :cascade}

      t.timestamps null: false
    end
  end
end
