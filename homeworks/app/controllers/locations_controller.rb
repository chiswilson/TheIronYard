class LocationsController < ApplicationController
	before_action :authenticate_user! 

	def index
		@locations = Location.all
	end

	def new
		@location = Location.new
	end

	def create
		@location = Location.new location_params
		@location.save
		redirect_to locations_path
	end

	def show
		@location = Location.find params[:id]		
	end

	def edit
	end

	def update
	end

	def destroy
	end


	private 

	def location_params
    	params.require(:location).permit(:name)
    end


end
