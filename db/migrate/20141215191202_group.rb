class Group < ActiveRecord::Migration
  def change
  	create_table :groups do |t|
  		t.string :group_name
  	end
  end
end
