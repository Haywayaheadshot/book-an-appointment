class Doctor < ApplicationRecord
  has_many :doctors_reservations, dependent: :destroy
  has_many :reservations, through: :doctors_reservations, dependent: :destroy
end
