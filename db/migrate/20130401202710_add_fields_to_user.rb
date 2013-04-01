class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :blog_id, :integer
    add_column :users, :user_name, :string
    add_column :users, :twitter_url, :string
    add_column :users, :github_url, :string
  end
end
