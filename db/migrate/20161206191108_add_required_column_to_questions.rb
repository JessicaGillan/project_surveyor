class AddRequiredColumnToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :required, :bool
  end
end
