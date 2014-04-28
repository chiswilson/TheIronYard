class MedicationsController < ApplicationController

	def new
		@patient = Patient.find params[:patient_id]
		@medication = @patient.medications.new
	end

	def create
		@patient = Patient.find params[:patient_id]
		@medication = @patient.medications.new medication_params
		@medication.save
		redirect_to patient_path(@patient)
	end

	private

    def medication_params
      params.require(:medication).permit(:name, :description)
    end
end
