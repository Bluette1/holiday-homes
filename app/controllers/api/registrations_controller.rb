class Api::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create

  def create
    user = User.new user_params
    if user.save
      render json: {
        messages: 'Sign Up Successfully',
        is_success: true,
        data: { user: user }
      }, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :username, :email, :password, :password_confirmation, :photo)
  end

  def ensure_params_exist
    return if params[:username].present?

    render json: {
      messages: 'Missing Params',
      is_success: false,
      data: {}
    }, status: :bad_request
  end
end
