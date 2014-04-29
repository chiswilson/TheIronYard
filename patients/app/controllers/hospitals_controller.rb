class HospitalsController < ApplicationController

	def new
		@hospital = Hospital.new
	end

	def create
		@hospital = Hospital.new hospital_params
		@hospital.save
		redirect_to root_path
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

	def new_doctor
		@hospital = Hospital.find params[:id]
		@doctor = @hospital.doctors.new

	end

	def create_doctor
		@hospital = Hospital.find params[:id]
		@doctor = @hospital.doctors.new doctor_params
		@doctor.save
		redirect_to hospital_path(@hospital)
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



