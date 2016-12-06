class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.text       :body
      t.references :question, foreign_key: true, null: false

      t.timestamps
    end
  end
end
