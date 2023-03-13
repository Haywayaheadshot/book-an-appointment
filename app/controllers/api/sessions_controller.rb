class Api::SessionsController < Devise::SessionsController
  def new
    user = User.find_by(username: sign_in_params[:username])
    if user&.valid_password?(sign_in_params[:password])
      render json: { message: 'success' }
    else
      # handle sign-in failure
      render json: { error: 'Wrong username or password' }, status: :unauthorized
    end
  end

  private

  def sign_in_params
    params.require(:user).permit(:username, :password)
  end
end
