class RemoveDetailsFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :details
  end
end
