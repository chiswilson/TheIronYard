class MedicationsController < ApplicationController

	def new
		@patient = Patient.find params[:patient_id]
		@medication = @patient.medications.new
	end

	def create
		@patient = Patient.find params[:patient_id]
		@medication = @patient.medications.new medication_params
		if @medication.save
			flash[:notice] = "Medication saved OK."
			redirect_to patient_path(@patient)
		else
			flash[:error] = "Error saving Medication!"
			render :new
		end
			
	end

	def destroy
		@patient = Patient.find params[:patient_id]
		@medication = Medication.find params[:id]
		@medication.delete
		redirect_to patient_path(@patient)

	end

	private

    def medication_params
      params.require(:medication).permit(:name, :description)
    end
end
