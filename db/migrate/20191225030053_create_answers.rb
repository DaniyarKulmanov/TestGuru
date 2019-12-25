class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.boolean :correct, default: false
      t.integer :question_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
