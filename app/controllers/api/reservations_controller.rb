class Api::ReservationsController < ApplicationController
  respond_to :json

  def create
    @reservation = Reservation.new(reservation_params)
    doctor = Doctor.find_by(id: params[:doctor_id])
    @doctors_reservation = DoctorsReservation.new(doctor:, reservation: @reservation)

    # Find the user by username and assign its id to user_id
    user = User.find_by(username: params[:userName])
    @reservation.user_id = user.id if user

    if @reservation.save && @doctors_reservation.save
      render json: { success: true, reservation_id: @reservation.id }
    else
      @reservation.destroy
      @doctors_reservation.destroy
      render json: { success: false, errors: @reservation.errors.full_messages }
    end
  end

  def index
    user = User.find_by(username: params[:username])
    if user
      reservations = user.reservations
      reservation_list = []
      reservations.each do |reservation|
        doctors_reservation = DoctorsReservation.where(reservation_id: reservation.id).first
        doctor_name = doctors_reservation.doctor.name if doctors_reservation.present?
        reservation_list << { reservation:, doctor_name: }
      end
      render json: { reservations: reservation_list }
    else
      render json: { success: false, errors: 'User not found' }
    end
  end

  private

  def reservation_params
    params.permit(:title, :reservation_date, :phone_number, :purpose, :location, :user_id, :doctor_id)
  end
end
