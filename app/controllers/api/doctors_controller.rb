class Api::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: @doctors, only: [:name, :specialty, :years_of_experience, :bio, :age, :qualifications,:location_of_work, :photo ]
  end
end
