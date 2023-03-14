require 'rails_helper'
require './app/controllers/api/doctors_controller'
require 'factory_bot_rails'
require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.default_driver = :chrome

RSpec.describe Api::ReservationsController, type: :controller do
  describe 'POST #create' do
    context 'when the reservation is valid' do
      before do
        @user = User.create(username: 'testuser', email: 'test@example.com', password: 'password')
        @doctor = Doctor.create(name: 'Doctor Abubakar Ummar', photo: 'images/doctor-abu.jpg', specialty: 'Radiology and Imaging', age: 40, location_of_work: 'Ghana',
                                years_of_experience: 18, qualifications: ' MBBS, MD (Radio-Diagnosis)',
                                bio: "Dr. Abubakar Ummar earned his MBBS in 2000 from V.S.S. Medical College, Accra, Ghana and his M.D. in Radio-Diagnosis in 2013 from S.C.B. Medical College, Cuttack, Accra, Ghana.
He has worked in various hospitals in Ghana as a Consultant Radiologist and has past experience in the U.A.E and moreover in RAK Hospital as a Specialist Radiologist.
He efficiently manages the diagnosis of human body using digital X-ray, Mammography, Ultrasound, Doppler, CT Scan, PET CT and MRI studies.")
        @reservation = Reservation.create(title: 'Test Reservation', reservation_date: '2033-10-20',
                                          phone_number: '45678900', purpose: 'Checkup', location: 'Test Clinic', doctor_name: 'Doctor Abubakar Ummar', user_id: @user.id)
        @doctors_reservation = DoctorsReservation.create(doctor_id: @doctor.id, reservation_id: @reservation.id)
      end

      it 'creates a new reservation' do
        expect(Reservation.count).to eq(1)
      end

      it "creates a new doctor's reservation" do
        expect(DoctorsReservation.count).to eq(1)
      end

      it 'associates the reservation with the correct user' do
        expect(Reservation.last.user.username).to eq('testuser')
      end
    end

    context 'when the reservation is invalid' do
      before do
        post :create,
             params: { title: '', reservation_date: Time.now, phone_number: '123-456-7890', purpose: 'Checkup',
                       location: 'Test Clinic', doctor_name: 'Dr. Smith', username: 'testuser' }
      end

      it 'does not create a new reservation' do
        expect(Reservation.count).to eq(0)
      end

      it "does not create a new doctor's reservation" do
        expect(DoctorsReservation.count).to eq(0)
      end
    end
  end
end
