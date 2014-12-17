class Plans < ActiveRecord::Migration
  def change
  	create_table :plans do |t|
  		t.string :time
  		t.string :location
  		t.string :name
  		t.timestamps
  	end
  end
end
