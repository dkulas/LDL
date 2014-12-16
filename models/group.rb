class Group < ActiveRecord::Base
	has_and_belongs_to_many :users

	validates :group_name, :presence => true
	validates :members, :presence => true
end