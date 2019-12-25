class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.integer :c_id

      t.timestamps
    end
    change_column_null(:tests, :title, false)
    change_column_default(:tests, :level, 0)
  end
end
