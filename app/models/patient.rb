class Patient < ApplicationRecord
    has_many :appointments
    has_many :physician, through: :appointments, dependent: :destroy

    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 15 }
    
end
