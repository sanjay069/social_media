class AddUserToFriends < ActiveRecord::Migration[8.0]
  def change
    add_reference :friends, :user, foreign_key: true
  end
end
