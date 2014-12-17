class Plan < ActiveRecord::Base
	belongs_to :user
	

	validates :name, :presence => true
	validates :location, :presence => true
	validates :time, :presence => true
end
