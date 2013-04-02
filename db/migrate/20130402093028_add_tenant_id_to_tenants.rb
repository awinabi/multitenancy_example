class AddTenantIdToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :tenant_id, :integer
    add_index :tenants, :tenant_id
  end
end
