class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.references :user, index: true
      t.date :consumed_on
      t.string :name
      t.text :description
      t.integer :quantity
      t.string :serving_description
      t.string :serving_id
      t.integer :calories
      t.integer :protein
      t.integer :fat
      t.integer :carbs
      t.integer :fiber

      t.timestamps
    end
  end
end
