class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :correct
      t.integer :question_id

      t.timestamps
    end
    change_column_default(:answers, :correct, from: nil, to: 'Yes')
  end
end
