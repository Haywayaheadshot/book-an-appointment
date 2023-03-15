class Api::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: @doctors,
           only: %i[id name specialty years_of_experience bio age qualifications location_of_work photo]
  end

  def destroy
    @doctor = Doctor.find_by(id: params[:id])
    if @doctor
      @doctor.transaction do
        @doctors_reservations = DoctorsReservation.find_by(doctor: @doctor)
        # @doctors_reservations.destroy # deletes all reservations of the doctor
        @doctor.destroy
      end
      render json: { message: "Doctor deleted successfully" }, status: :ok
    else
      render json: { error: "Doctor not found" }, status: :not_found
    end
  end

  def create 
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: { success: true, doctor_id: @doctor.id }
    else
      render json: { success: false, errors: @doctor.errors.full_messages }
    end
  end

  private

  def doctor_params
    params.permit(:name, :specialty, :years_of_experience, :bio, :age, :qualifications, :location_of_work, :photo)
  end  
end
