class DvdsController < ApplicationController

	def index
		@mydvds = Dvd.all
	end

	def new
		@mydvd = Dvd.new
	end

	def create
		@mydvd = Dvd.new dvd_params
		if @mydvd.save
			flash[:notice]= "DVD added OK."
			redirect_to dvds_path
		else
		    flash[:error]= "Error saving this DVD!"
		    render :new
		end 
	end

	def destroy
		@mydvd = Dvd.find params[:id]
		@mydvd.delete 
		redirect_to dvds_path
	end

	def edit
		@mydvd = Dvd.find params[:id]

	end

	def update
		@mydvd = Dvd.find params[:id]
		if @mydvd.update_attributes dvd_params
			flash[:notice]= "DVD updated OK."
			redirect_to dvds_path
		else
		    flash[:error]= "Error updating this DVD!"
		    # render :new
		    redirect_to dvds_path
		end 

	end



	private
    def dvd_params
      params.require(:dvd).permit(:title, :year, :genre, :rating)
    end





end
