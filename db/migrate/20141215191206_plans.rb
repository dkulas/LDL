class Plan < ActiveRecord::Migration
  def change
  	create_tables :plans do |t|
  		t.integer :user_id
  		t.string :location
  end
end
