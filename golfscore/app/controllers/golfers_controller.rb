class GolfersController < ApplicationController
	respond_to :html

	def index
		@golfers = Golfer.all
	end

	def new
		@golfer = Golfer.new
		respond_with @golfer
	end

	def create
		@golfer = Golfer.new golfer_params
		if @golfer.save
    		respond_with @golfer, location: golfers_path
    	else
      		render :new
    	end
	end

	def edit
		@golfer = Golfer.find params[:id]
		respond_with @golfer
	end

	def update
		@golfer = Golfer.find params[:id]
		@golfer.update_attributes golfer_params
		redirect_to root_path
	end

	def destroy
	end

	def show
	end

private
	def golfer_params
      params.require(:golfer).permit(:name, :nationality, :birthdate)
  	end

end
