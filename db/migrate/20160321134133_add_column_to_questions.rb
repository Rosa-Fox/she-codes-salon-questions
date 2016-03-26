class AddColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :seen, :boolean
  end
end
