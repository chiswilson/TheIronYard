class Patient < ActiveRecord::Base
  belongs_to :hospital
  has_many :medications

	validates :name, presence: true
    validates :description, presence: true, length: {minimum: 1}

  include Workflow
  workflow do
    state :waiting do
      event :go_to_doctor,  transitions_to: :doctor
      event :go_to_xray,    transitions_to: :xray
      event :go_to_surgery, transitions_to: :surgery
      event :go_to_leaving, transitions_to: :leaving
    end
    state :doctor do
      event :go_to_xray,    transitions_to: :xray
      event :go_to_surgery, transitions_to: :surgery
      event :go_to_billpay, transitions_to: :billpay
    end
    state :xray do
      event :go_to_doctor,  transitions_to: :doctor
      event :go_to_surgery, transitions_to: :surgery
      event :go_to_billpay, transitions_to: :billpay
    end
    state :surgery do
      event :go_to_doctor,  transitions_to: :doctor
      event :go_to_xray,    transitions_to: :xray
      event :go_to_billpay, transitions_to: :billpay
    end
    state :billpay do
      event :go_to_patientpaid, transitions_to: :leaving
    end       
    state :leaving
  end
end
