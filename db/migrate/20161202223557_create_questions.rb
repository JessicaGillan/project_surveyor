class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text    :question

      t.references :survey, foreign_key: true, null: false
      t.integer    :question_type_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
