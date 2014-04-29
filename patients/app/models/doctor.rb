class Doctor < ActiveRecord::Base
	validates :name, presence: true
	belongs_to :curable, polymorphic: true
end
