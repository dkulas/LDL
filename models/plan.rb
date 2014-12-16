class Plan < ActiveRecord::Base
	belongs_to :user
	

	validates :user_id, :presence => true
	validates :location, :presence => true
	validates :time, :presence => true
end
