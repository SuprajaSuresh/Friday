class RemoveIsFriendFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :isfriend
  end

  def down
    add_column :users, :isfriend, :bool
  end
end
