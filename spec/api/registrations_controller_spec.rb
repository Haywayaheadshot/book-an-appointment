require 'rails_helper'
require 'capybara'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.default_driver = :chrome

RSpec.describe Api::RegistrationsController, type: :controller do
  describe 'POST create' do
    context 'when registration is valid' do
      let(:valid_params) do
        {
          user: {
            name: 'John Doe',
            email: 'john.doe@example.com',
            username: 'johndoe',
            password: 'password',
            photo: Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/sample.png'), 'image/jpeg')
          }
        }
      end

      before do
        @request.env['devise.mapping'] = Devise.mappings[:user] # Add this line
        post :create, params: valid_params
      end

      it 'returns a JSON response with success and user_id attributes' do
        post :create, params: valid_params
        expect(response).to have_http_status(302)
        expect(response.content_type).to eq('text/html; charset=utf-8')
      end
    end
  end
end
