class RemoveBlogIdFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :blog_id
  end

  def down
  end
end
