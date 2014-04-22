class HomeController < ApplicationController

	def index
		@hospitals = Hospital.all

		# @patients = Patient.where.not(workflow_state: "leaving")
		
		# if params[:q] == "Sort By Location"
		#     @sortfield = "workflow_state"
		# else
		# 	@sortfield = "name"
		# end
	end

end
