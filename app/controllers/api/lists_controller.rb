class Api::ListsController < ApiController
  before_action :authenticate

  def index
    lists = current_user.lists
    render json: lists, each_serializer: ListSerializer
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(list_params)

    if @list.save
      render json: @list, each_serializer: ListSerializer
    else
      render json: @list.errors, status: :unprocessable_entity
    end

  end

  def list_params
    params.require(:list).permit(:title, :description)
  end
end