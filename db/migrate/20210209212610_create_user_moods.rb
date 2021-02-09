class CreateUserMoods < ActiveRecord::Migration[5.2]
  def change
    create_table :user_moods do |t|
      t.integer :user_id
      t.integer :entry_id
    end
  end
end
