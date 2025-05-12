class AddROleToFriend < ActiveRecord::Migration[8.0]
  def change
    add_column :friends, :role, :integer, default: 0
  end
end
