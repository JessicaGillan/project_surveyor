class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.text       :body

      t.references :question, :foreign_key => true, null: false

      t.timestamps
    end
  end
end
