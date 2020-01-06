class RemoveUserIdFromTests < ActiveRecord::Migration[6.0]
  def change
    remove_index :tests, :user_id
    remove_column :tests, :user_id, :integer
  end
end
