class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :physician

  validates :patient_id, :numericality => { :only_integer => true }, presence: true
  validates :physician_id, :numericality => { :only_integer => true }, presence: true
  validates :appointment_data, presence: true



end
