class AddTenantIdToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :tenant_id, :integer
    add_index :blogs, :tenant_id
  end
end
