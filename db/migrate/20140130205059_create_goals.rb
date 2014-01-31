class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :steps
      t.integer :sleep
      t.integer :calories
      t.float :fat
      t.float :protein
      t.float :carbohydrates
    end
  end
end
