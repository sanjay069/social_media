class AddImageToFriends < ActiveRecord::Migration[8.0]
  def change
    add_column :friends, :image, :string
  end
end
