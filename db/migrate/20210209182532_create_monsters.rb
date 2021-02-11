class CreateMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :level
      t.integer :current_health
      t.integer :max_health
      t.references :user

      t.timestamps null: false
    end
  end
end