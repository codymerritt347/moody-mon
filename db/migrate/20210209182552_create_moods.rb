class CreateMoods < ActiveRecord::Migration[5.2]
  def change
    create_table :moods do |t|
      t.string :name
      t.string :effect
      t.integer :amount
      t.references :entry

      t.timestamps null: false
    end
  end
end
