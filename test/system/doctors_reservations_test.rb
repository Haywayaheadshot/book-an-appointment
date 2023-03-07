require "application_system_test_case"

class DoctorsReservationsTest < ApplicationSystemTestCase
  setup do
    @doctors_reservation = doctors_reservations(:one)
  end

  test "visiting the index" do
    visit doctors_reservations_url
    assert_selector "h1", text: "Doctors reservations"
  end

  test "should create doctors reservation" do
    visit doctors_reservations_url
    click_on "New doctors reservation"

    click_on "Create Doctors reservation"

    assert_text "Doctors reservation was successfully created"
    click_on "Back"
  end

  test "should update Doctors reservation" do
    visit doctors_reservation_url(@doctors_reservation)
    click_on "Edit this doctors reservation", match: :first

    click_on "Update Doctors reservation"

    assert_text "Doctors reservation was successfully updated"
    click_on "Back"
  end

  test "should destroy Doctors reservation" do
    visit doctors_reservation_url(@doctors_reservation)
    click_on "Destroy this doctors reservation", match: :first

    assert_text "Doctors reservation was successfully destroyed"
  end
end
