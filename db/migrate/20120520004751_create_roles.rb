class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :key, :null => false
      t.string :name, :null => false
    end
    add_index :roles, :key, :unique => true
    add_index :roles, :name, :unique => true
  end
end
