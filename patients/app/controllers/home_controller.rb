class HomeController < ApplicationController

	def index
		@patients = Patient.where.not(workflow_state: "leaving")
		@sortfield = "name"
	end

end
