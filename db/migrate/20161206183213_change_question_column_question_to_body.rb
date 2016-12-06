class ChangeQuestionColumnQuestionToBody < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :question, :body
  end
end
