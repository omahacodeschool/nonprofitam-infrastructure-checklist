class AddChecklistIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :checklist_id, :integer
  end
end
