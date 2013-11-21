class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.datetime :date
      t.references :photographer, index: true
      t.references :customer, index: true
      t.string :camera
      t.string :lat
      t.string :lng
      t.string :location

      t.timestamps
    end
  end
end
