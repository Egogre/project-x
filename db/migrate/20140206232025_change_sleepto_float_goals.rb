class ChangeSleeptoFloatGoals < ActiveRecord::Migration
  def change
    remove_column :goals, :sleep
    add_column :goals, :sleep, :float
  end
end
