class Api::ItemsController < ApiController
  before_action :authenticate

  def index
    @list = List.find(params[:list_id])
    @items = @list.items
    render json: @items, each_serializer: ItemSerializer
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)

    if @item.save
      render json: @item, each_serializer: ItemSerializer
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
    if @item
      render json: @item, each_serializer: ItemSerializer
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.destroy
      render json: { head: :ok }
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def item_params
    params[:item].permit(:content)
  end
end