class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :question

      t.integer :survey_id, :foreign_key => true

      t.timestamps
    end
  end
end
