class RemoveYearsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :years, :integer
  end
end
