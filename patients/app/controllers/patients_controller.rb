class PatientsController < ApplicationController

	def index
		redirect_to root_path
	end

    # gonna create a new patient
	def new
		@patient = Patient.new
	end

	def create
		@patient = Patient.new patient_params
		@patient.workflow_state = "waiting"
		@patient.description = "(enter description)"
		if @patient.save
			flash[:notice]= "Patient added OK."
			redirect_to root_path
		else
		    flash[:error]= "Error adding Patient!"
		    render :new
		end 
	end

	def go_to_surgery
		@patient = Patient.find params[:id]
		@patient.go_to_surgery!
		redirect_to root_path
	end

	def go_to_xray
		@patient = Patient.find params[:id]
		@patient.go_to_xray!
		redirect_to root_path
	end

	def go_to_doctor
		@patient = Patient.find params[:id]
		@patient.go_to_doctor!
		redirect_to root_path
	end

	def go_to_billpay
		@patient = Patient.find params[:id]
		@patient.go_to_billpay!
		redirect_to root_path
	end

	def go_to_leaving
		@patient = Patient.find params[:id]
		@patient.go_to_leaving!
		redirect_to root_path
	end

	def go_to_patientpaid
		@patient = Patient.find params[:id]
		@patient.go_to_patientpaid!
		redirect_to leave_description_patient_path
	end

	def leave_description
		@patient = Patient.find params[:id]
	end

	def update
		@patient = Patient.find params[:id]		
		if @patient.update_attributes patient_params
		 	# flash[:notice]= "Patient updated OK."
		 	redirect_to root_path
		else
		    flash[:error]= "Error updating this Patient!"
		    render :leave_description
		end
	end

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
      params.require(:patient).permit(:name, :dateofbirth, :description)
    end
end
