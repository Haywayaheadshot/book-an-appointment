class Api::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  # Override the default create action to return a JSON response
  def create
    build_resource(sign_up_params)

    if resource.save
      # Successful registration
      sign_in(resource_name, resource)
      render json: { success: true, user_id: resource.id }
    else
      # Invalid registration
      clean_up_passwords resource
      set_minimum_password_length
      render json: { success: false, errors: resource.errors.full_messages }
    end
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :username, :photo)
  end
end
