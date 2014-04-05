class RemoveYearFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :year, :integer
  end
end
