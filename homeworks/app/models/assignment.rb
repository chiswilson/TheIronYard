class Assignment < ActiveRecord::Base
	belongs_to :course
	belongs_to :user
	has_many :submissions
	has_many :comments, as: :commentable

end
