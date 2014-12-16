class Plans < ActiveRecord::Migration
  def change
  	create_table :plans do |t|
  		t.integer :user_id
  		t.string :location
  		t.timestamps
  	end
  end
end
