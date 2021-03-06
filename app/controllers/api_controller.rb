class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  # necessary in all controllers that will respond with JSON
  respond_to :json 

  private

  def authenticate
    return permission_denied_error unless conditions_met
  end

  # Error responses and before_filter blocking work differently with Javascript requests.
  # Rather than using before_filters to authenticate actions, we suggest using
  # "guard clauses" like `permission_denied_error unless condition`
  def permission_denied_error
    error(403, 'Permission Denied!')
  end

  def error(status, message = 'Something went wrong')
    response = {
      response_type: "ERROR",
      message: message
    }

    render json: response.to_json, status: status
  end

  def conditions_met
    @user = User.find_by(email: params[:email])
    Rails.logger.info @user.inspect
    if @user && params[:password]
      if @user.valid_password?(params[:password])
        sign_in(@user)
      end
      user_signed_in?
    end
  end

end