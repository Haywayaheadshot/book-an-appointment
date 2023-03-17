class Reservation < ApplicationRecord
  has_many :doctors_reservations, dependent: :destroy
  has_many :doctors, through: :doctors_reservations, dependent: :destroy
  belongs_to :user
end
