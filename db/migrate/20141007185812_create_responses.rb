class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.text :answers_hash

      t.timestamps
    end
  end
end
