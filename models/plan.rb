class Plan < ActiveRecord::Base
	has_and_belongs_to_many :users

	validates :user_id, :presence => true
	validates :location, :presence => true
	validates :time, :presence => true
end
