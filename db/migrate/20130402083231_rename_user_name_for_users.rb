class RenameUserNameForUsers < ActiveRecord::Migration
  def up
    remove_column :users, :user_name
    add_column :users, :name, :string
  end

  def down
  end
end
