class Hpconnect < ActiveRecord::Base
	belongs_to :patient
	belongs_to :hospital
end
