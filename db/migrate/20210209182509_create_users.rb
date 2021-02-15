class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.date :birthday
      t.string :favorite_color
      t.string :favorite_food
      t.integer :streak

      t.timestamps null: false
    end
  end
end
