class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :years_business, :integer
    add_column :users, :years_relationships, :integer
    add_column :users, :years_careers, :integers
    add_column :users, :years_lifeoutlook, :integer
  end
end
