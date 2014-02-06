class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :steps
      t.float :sleep
      t.date :date
      t.references :user, index: true

      t.timestamps
    end
  end
end
