class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :test_id

      t.timestamps
    end
    change_column_null(:users, :name, false)
  end
end
