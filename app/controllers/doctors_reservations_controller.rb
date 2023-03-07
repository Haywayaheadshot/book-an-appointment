class DoctorsReservationsController < ApplicationController
  before_action :set_doctors_reservation, only: %i[ show edit update destroy ]

  # GET /doctors_reservations or /doctors_reservations.json
  def index
    @doctors_reservations = DoctorsReservation.all
  end

  # GET /doctors_reservations/1 or /doctors_reservations/1.json
  def show
  end

  # GET /doctors_reservations/new
  def new
    @doctors_reservation = DoctorsReservation.new
  end

  # GET /doctors_reservations/1/edit
  def edit
  end

  # POST /doctors_reservations or /doctors_reservations.json
  def create
    @doctors_reservation = DoctorsReservation.new(doctors_reservation_params)

    respond_to do |format|
      if @doctors_reservation.save
        format.html { redirect_to doctors_reservation_url(@doctors_reservation), notice: "Doctors reservation was successfully created." }
        format.json { render :show, status: :created, location: @doctors_reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @doctors_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors_reservations/1 or /doctors_reservations/1.json
  def update
    respond_to do |format|
      if @doctors_reservation.update(doctors_reservation_params)
        format.html { redirect_to doctors_reservation_url(@doctors_reservation), notice: "Doctors reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @doctors_reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doctors_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors_reservations/1 or /doctors_reservations/1.json
  def destroy
    @doctors_reservation.destroy

    respond_to do |format|
      format.html { redirect_to doctors_reservations_url, notice: "Doctors reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctors_reservation
      @doctors_reservation = DoctorsReservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doctors_reservation_params
      params.fetch(:doctors_reservation, {})
    end
end
