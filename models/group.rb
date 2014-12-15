class Group < ActiveRecord::Base
	has_many :users

	validates :group_name