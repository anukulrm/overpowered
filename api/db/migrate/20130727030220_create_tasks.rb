class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :notes
      t.integer :chain_id
      t.datetime :begin
      t.integer :duration
      t.datetime :completed_on

      t.timestamps
    end
  end
end
