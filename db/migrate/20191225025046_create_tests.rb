class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0
      t.integer :category_id, foreign_key: true, index: true
      t.integer :user_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
