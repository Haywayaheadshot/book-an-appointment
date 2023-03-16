class Doctor < ApplicationRecord
  has_many :doctors_reservations, dependent: :destroy
end
