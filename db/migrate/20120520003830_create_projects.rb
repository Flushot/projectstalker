class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :summary, :null => false
      t.text :details
      t.integer :owner_id, :null => false
      t.boolean :active, :default => true, :null => false

      t.string :photo_file_name # Original filename
      t.string :photo_content_type # Mime type
      t.integer :photo_file_size # File size in bytes
      t.timestamp :photo_last_updated_at

      t.timestamps
    end
  end
end
