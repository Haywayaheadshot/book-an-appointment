require "test_helper"

class DoctorsReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctors_reservation = doctors_reservations(:one)
  end

  test "should get index" do
    get doctors_reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_doctors_reservation_url
    assert_response :success
  end

  test "should create doctors_reservation" do
    assert_difference("DoctorsReservation.count") do
      post doctors_reservations_url, params: { doctors_reservation: {  } }
    end

    assert_redirected_to doctors_reservation_url(DoctorsReservation.last)
  end

  test "should show doctors_reservation" do
    get doctors_reservation_url(@doctors_reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_doctors_reservation_url(@doctors_reservation)
    assert_response :success
  end

  test "should update doctors_reservation" do
    patch doctors_reservation_url(@doctors_reservation), params: { doctors_reservation: {  } }
    assert_redirected_to doctors_reservation_url(@doctors_reservation)
  end

  test "should destroy doctors_reservation" do
    assert_difference("DoctorsReservation.count", -1) do
      delete doctors_reservation_url(@doctors_reservation)
    end

    assert_redirected_to doctors_reservations_url
  end
end
