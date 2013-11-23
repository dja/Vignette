class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :user_id, null: false
      t.string :direct_upload_url, null: false
      t.attachment :upload
      t.boolean :processed, default: false, null: false
      
      t.timestamps
    end
    add_index :albums, :user_id
    add_index :albums, :processed
  end
end