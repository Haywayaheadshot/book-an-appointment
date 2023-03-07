class Api::ReservationsController < ApplicationController
  respond_to :json
  def create
    # build_resource(reservation_params)
    @reservation = Reservation.new(reservation_params)
    @doctors = Doctor.where(name: params(:doctor_name))
    @DoctorsReservation = DoctorsReservation.new(doctor_id: @doctors.ids, reservation_id: @reservation.id)
    if @reservation.save && @DoctorsReservation.save
      render json: { success: true, reservation_id: @reservation.id }
    else
      render json: { success: false, errors: @reservation.errors.full_messages }
    end
  end

  private

  def reservation_params
    params.permit(:title, :reservation_date, :phone_number, :purpose, :location, :doctor_name, :user_id)
  end
end
