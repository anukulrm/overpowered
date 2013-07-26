class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :description
      t.text :name, null: false
      t.datetime :end_date, null: true

      t.timestamps
    end
  end
end
