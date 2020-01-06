class CreateTestsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tests, :users, table_name: :certifications do |t|
      t.index :test_id
      t.index :user_id

      t.timestamps
    end
  end
end
