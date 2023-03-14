require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do
  describe 'POST #new' do
  before do
    @user = User.create(username: 'testuser', email: 'test@example.com', password: 'password')
  end

    context 'with valid credentials' do
      it 'returns a success message' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
