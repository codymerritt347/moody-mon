class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :note
      t.references :user

      t.timestamps null: false
    end
  end
end
