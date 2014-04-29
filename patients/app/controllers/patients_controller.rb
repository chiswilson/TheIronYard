class PatientsController < ApplicationController

	def index
		redirect_to root_path
	end

    # gonna create a new patient
	def new
		@hospital = Hospital.find params[:hospital_id]
		@patient = @hospital.patients.new
	end

	def create
		@hospital = Hospital.find params[:patient][:hospital_ids][0]
		@patient = @hospital.patients.new patient_params
		# puts @patient.inspect
		# puts @patient.hospitals.inspect
		@patient.workflow_state = "waiting"
		@patient.description = "(enter description)"
		if @patient.save
			flash[:notice]= "Patient added OK."
			redirect_to hospital_path(@hospital)
		else
		    flash[:error]= "Error adding Patient!"
		    render :new
		end 
	end

	def show
		# @hospital = Hospital.find params[:hospital_id]
		@patient = Patient.find params[:id]
	end

	def update
		@patient = Patient.find params[:id]		
		if @patient.update_attributes patient_params
		 	# flash[:notice]= "Patient updated OK."
		 	redirect_to hospital_path(params[:patient][:hospital_id])
		else
		    flash[:error]= "Error updating this Patient!"
		    render :leave_description
		end
	end

# ****************************
	def go_to_surgery
		@patient = Patient.find params[:id]
		@patient.go_to_surgery!
		redirect_to hospital_path(params[:hospital_id])
	end

	def go_to_xray
		@patient = Patient.find params[:id]
		@patient.go_to_xray!
		redirect_to hospital_path(params[:hospital_id])
	end

	def go_to_doctor
		@patient = Patient.find params[:id]
		@patient.go_to_doctor!
		redirect_to hospital_path(params[:hospital_id])
	end

	def go_to_billpay
		@patient = Patient.find params[:id]
		@patient.go_to_billpay!
		redirect_to hospital_path(params[:hospital_id])
	end

	def go_to_leaving
		@patient = Patient.find params[:id]
		@patient.go_to_leaving!
		redirect_to hospital_path(params[:hospital_id])
	end

	def go_to_patientpaid
		@patient = Patient.find params[:id]
		@patient.go_to_patientpaid!
		@hospital = Hospital.find params[:hospital_id]
		render :leave_description
		# redirect_to leave_description_patient_path(params[:hospital_id])
	end

	def leave_description
		@hospital = Hospital.find params[:hospital_id]
		@patient = Patient.find params[:id]
	end

# ****************************	
	def new_doctor
		@patient = Patient.find params[:id]
		@doctor = @patient.doctors.new
	end

	def create_doctor
		@patient = Patient.find params[:id]
		@doctor = @patient.doctors.new doctor_params
		@doctor.save
		redirect_to patient_path(@patient)
	end

	def delete_doctor
		@patient = Patient.find params[:id]
		docid = params[:doctor]
		@doctor = Doctor.find docid
		@doctor.delete
		redirect_to patient_path(@patient)
	end

# ****************************
	def search_names
		@search_names = Patient.search_names params[:q]
	end

# ****************************
	def sort_by_name
		@patients = Patient.where.not(workflow_state: "leaving")	
		@sortfield = "name"		
		render "home/index"
	end

	def sort_by_location
		@patients = Patient.where.not(workflow_state: "leaving")
		@sortfield = "workflow_state"		
		render "home/index"
	end



	private

    def patient_params
      params.require(:patient).permit(:name, :dateofbirth, :description, {hospital_ids: []}
      	)
    end

    def doctor_params
    	params.require(:doctor).permit(:name)
    end
end
