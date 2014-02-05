class ChangeStatsToFloats < ActiveRecord::Migration
  def change
    remove_column :foods, :protein
    add_column :foods, :protein , :float
    remove_column :foods, :fat
    add_column :foods, :fat , :float
    remove_column :foods, :carbs
    add_column :foods, :carbs , :float
    remove_column :foods, :fiber
    add_column :foods, :fiber , :float
  end
end
