class Api::SessionsController < Devise::SessionsController
  def new
    user = User.find_by(username: params[:username])

    if user && user.valid_password?(params[:password])
      session[:user_id] = user.id
      render json: { message: "Logged in successfully!" }
    else
      render json: { error: "Wrong username or password" }, status: :unauthorized
    end
  end
end