class Plan < ActiveRecord::Migration
  def change
  	create_table :plans do |t|
  		t.integer :user_id
  		t.string :location
  	end
  end
end
