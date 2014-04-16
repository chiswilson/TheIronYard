class PresidentsController < ApplicationController

  # def index
  #   # GET
  #   # List of data
  #   # Replaced by our home index CURRENTLY
  # end

  def show
    # GET
    # Shows an individual object
    @president = President.find params[:id]
  end

  def new
    # GET
    # Brings you to the new page
    @president = President.new
  end

  def create
    # POST
    # Creates the data
    @president = President.create president_params
    redirect_to root_path
  end

  def edit
    # GET
    # Brings you to the edit page
    @president = President.find params[:id]
  end

  def update
    # PUT/PATCH
    # Updates existing data
    @president = President.find params[:id]
    @president.update_attributes president_params
    redirect_to root_path
  end

  def destroy
    # DELETE
    # Deletes stuff
    @president = President.find params[:id]
    @president.delete
    redirect_to root_path
  end


  private
    def president_params
      params.require(:president).permit(:name, :terms, :borndate)
    end

end