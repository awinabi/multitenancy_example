class AddTenantIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :tenant_id, :integer
    add_index :comments, :tenant_id
  end
end
