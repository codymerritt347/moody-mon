class RemoveBreatheTogether < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :breathe_together
  end
end