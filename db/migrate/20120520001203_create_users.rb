class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email, :null => false
      t.string :password
      t.boolean :active, :default => true, :null => false

      t.decimal :latitude, :precision => 15, :scale => 10
      t.decimal :longitude, :precision => 15, :scale => 10
      t.timestamp :last_position_at

      t.string :photo_file_name # Original filename
      t.string :photo_content_type # Mime type
      t.integer :photo_file_size # File size in bytes
      t.timestamp :photo_last_updated_at

      t.timestamps
    end
  end
end
