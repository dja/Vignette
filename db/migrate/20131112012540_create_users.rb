class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

        t.string :type
    	t.string :name
        t.string :first_name
        t.string :last_name
        t.string :email
        t.string :user_birthday
        t.string :username
    	t.string :link
        t.string :image
        t.string :user_location
        t.string :address
        t.string :city
        t.string :state
        t.string :zip
    	t.integer :rating
    	t.integer :radius
    	t.string :camera
    	t.string :bio
    	t.string :fact
    	t.boolean :available, default: false
        t.string :uid
        t.string :provider
        t.string :oauth_token
        t.datetime :oauth_expires_at

    	t.timestamps
    end
  end
end
