class DoctorsReservation < ApplicationRecord
  belongs_to :doctor
  belongs_to :reservation
end
