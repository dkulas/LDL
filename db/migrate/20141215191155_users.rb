class User < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.string :email
  		t.string :password
  		t.integer :phone_number
  		t.integer :group_id
  	end
  end
end
