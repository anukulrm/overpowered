class RemoveChainsAndGoals < ActiveRecord::Migration
  def up
    drop_table :goals
    drop_table :chains
  end

  def down
  end
end
