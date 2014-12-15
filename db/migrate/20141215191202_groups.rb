class Group < ActiveRecord::Migration
  def change
  	create_tables :groups do |t|
  		t.string :group_name
  	end
  end
end
