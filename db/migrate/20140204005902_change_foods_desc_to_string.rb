class ChangeFoodsDescToString < ActiveRecord::Migration
  def change
    remove_column :foods, :description
    add_column :foods, :description, :string
  end
end
