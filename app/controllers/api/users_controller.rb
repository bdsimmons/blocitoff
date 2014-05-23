class Api::UsersController < ApiController
  before_action :authenticate

  def index
    return permission_denied_error unless conditions_met

    users = User.all

    render json: users, each_serializer: UserSerializer
  end
end