class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :name

      t.timestamps
    end
  end
end
