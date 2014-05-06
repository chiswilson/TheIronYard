class HospitalsController < ApplicationController

	def new
		@hospital = Hospital.new
	end

	def create
		@hospital = Hospital.new hospital_params
		if @hospital.save == true
      		flash[:notice] = "Hospital saved OK."
      		redirect_to root_path
    	else
      		flash[:error] = "Error saving Hospital!"
      		render :new
    	end
	end

	def edit
	end

	def update
	end

	# show a specific hospital...
	def show
		@hospital = Hospital.find params[:id]
	end

	def destroy
	end

# ******************************************************
	def search_patients
		@hospital = Hospital.find params[:id]
		respond_to do |format|
      	  format.js
      	end  	

	end

# ******************************************************
	def new_doctor
		@hospital = Hospital.find params[:id]
		@doctor = @hospital.doctors.new
	end

	def create_doctor
		@hospital = Hospital.find params[:id]
		@doctor = @hospital.doctors.new doctor_params
		if @doctor.save
			flash[:notice] = "Doctor saved OK."
			redirect_to hospital_path(@hospital)
		else
			flash[:error] = "Error saving Doctor!"
      		render :new_doctor
      	end
	end

	def delete_doctor
		@hospital = Hospital.find params[:id]
		@doctor = Doctor.find params[:doctor]
		@doctor.delete
		redirect_to hospital_path(@hospital)
	end



	private

    def hospital_params
        params.require(:hospital).permit(:name)
    end

    def doctor_params
    	params.require(:doctor).permit(:name)
    end
end

# How do I link a patient to the hospital
# Somehow, you need to pass the hospital in when creating a patient.
#    @hospital.patients.new
# Inside hte patients create
#    



