class RemoveFoodsDescription < ActiveRecord::Migration
  def change
    remove_column :foods, :description
  end
end
