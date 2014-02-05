class AddFiberToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :fiber, :float
  end
end
