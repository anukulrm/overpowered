class RemoveChainIdFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :chain_id
  end

  def down
  end
end
