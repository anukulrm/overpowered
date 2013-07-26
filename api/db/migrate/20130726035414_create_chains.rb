class CreateChains < ActiveRecord::Migration
  def change
    create_table :chains do |t|
      t.integer :goal_id
      t.string :name, null:false
      t.text :description

      t.timestamps
    end
  end
end
