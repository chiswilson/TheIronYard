class Course < ActiveRecord::Base
	belongs_to :location

	has_many :coursejoins
	has_many :users, through: :coursejoins

	has_many :assignments


end
