class Physician < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments, dependent: :destroy

    validates :name, presence: true
end
