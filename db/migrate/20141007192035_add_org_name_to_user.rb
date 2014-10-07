class AddOrgNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :org_name, :string
  end
end
