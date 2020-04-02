class CertificationModel < ActiveRecord::Migration[6.0]
  def change
    create_table :certifications do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.references :current_question, foreign_key: false
      t.integer :correct_questions, default: 0

      t.timestamps
    end
  end
end
