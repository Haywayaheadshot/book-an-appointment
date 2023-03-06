class Api::SessionsController < Devise::SessionsController

  def new
    user = User.find_by(username: sign_in_params[:username])
    if user && user.valid_password?(sign_in_params[:password])
    # if user&.authenticate(sign_in_params[:password])
      # sign in the user and redirect to the desired page
      render json: { message: "Logged in successfully!" }
    else
      # handle sign-in failure
      render json: { error: "Wrong username or password" }, status: :unauthorized
    end
  end

  private
  def sign_in_params
    params.require(:user).permit(:username, :password)
  end
end