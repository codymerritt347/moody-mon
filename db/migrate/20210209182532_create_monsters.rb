class CreateMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :health
      t.integer :user_id, foreign_key: true
    end
  end
end
