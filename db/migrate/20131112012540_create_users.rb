class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :type
    	t.string :act_primary
    	t.string :act_secondary
    	t.string :name
    	t.string :avatar
    	t.string :location
    	t.string :latitude
    	t.string :longitude
    	t.integer :rating
    	t.integer :radius
    	t.string :camera
    	t.string :bio
    	t.string :fact
    	t.boolean :available
    	t.integer :radius
    	t.string :camera
    	t.string :bio
    	t.string :fact
    	t.boolean :available

    	t.timestamps
    end
  end
end
