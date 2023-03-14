require 'rails_helper'
require './app/controllers/api/doctors_controller'
require 'factory_bot_rails'
require 'capybara'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  # ...
end
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.default_driver = :chrome

RSpec.describe Api::DoctorsController, type: :controller do
  describe 'GET index' do
    let!(:doctors) { create_list(:doctor, 3) } # Using FactoryBot to create 3 doctors for testing

    before { get :index }

    it 'returns a 200 OK status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns a JSON response with the correct attributes' do
      json_response = JSON.parse(response.body)

      expect(json_response[0]).to include(
        'name',
        'specialty',
        'years_of_experience',
        'bio',
        'age',
        'qualifications',
        'location_of_work',
        'photo'
      )
    end

    it 'returns all doctors' do
      json_response = JSON.parse(response.body)

      expect(json_response.count).to eq(3)
    end
  end
end
