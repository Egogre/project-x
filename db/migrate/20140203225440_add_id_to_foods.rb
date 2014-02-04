class AddIdToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :food_id, :integer
  end
end
