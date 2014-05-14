class CoursesController < ApplicationController
	before_action :authenticate_user! 

	def new
		# @location = Location.find params[:location_id]
		@location_id = params[:location_id]
		# @course = @location.courses.new
		@course = Course.new
	end

	def create		
		@location = Location.find params[:course][:location_id]

		@course = @location.courses.new course_params
		@course.save
		redirect_to location_path(@location)
	end

	def show
		@course = Course.find params[:id]

	end

	private 

	def course_params
    	params.require(:course).permit(:name)
    end


end
