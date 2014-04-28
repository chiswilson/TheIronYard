class Doctor < ActiveRecord::Base
	belongs_to :curable, polymorphic: true
end
