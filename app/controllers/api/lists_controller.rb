class Api::ListsController < ApiController
  before_action :authenticate

  def index
    lists = current_user.lists
    render json: lists, each_serializer: ListSerializer
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      render json: @list, each_serializer: ListSerializer
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    if @list
      render json: @list, each_serializer: ListSerializer
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      render json: { head: :ok }
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      render json: { head: :ok }
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def list_params
    params.require(:list).permit(:title, :description, :permissions)
  end
end