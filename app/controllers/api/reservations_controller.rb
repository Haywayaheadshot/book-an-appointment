class Api::ReservationsController < ApplicationController
  respond_to :json

  def create
    @reservation = Reservation.new(reservation_params)
    doctor = Doctor.find_by(name: params[:doctor_name])
    @doctors_reservation = DoctorsReservation.new(doctor: doctor, reservation: @reservation)

    # Find the user by username and assign its id to user_id
    user = User.find_by(username: params[:username])
    @reservation.user_id = user.id if user

    if @reservation.save
      if @doctors_reservation.save
        render json: { success: true, reservation_id: @reservation.id }
      else
        @reservation.destroy
        render json: { success: false, errors: @doctors_reservation.errors.full_messages }
      end
    else
      render json: { success: false, errors: @reservation.errors.full_messages }
    end
  end

  def index
    user = User.find_by(username: params[:username])
    if user
      reservations = user.reservations
      render json: { reservations: reservations }
    else
      render json: { success: false, errors: 'User not found' }
    end
  end

  private

  def reservation_params
    params.permit(:title, :reservation_date, :phone_number, :purpose, :location, :doctor_name, :user_id)
  end
end
