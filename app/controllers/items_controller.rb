class ItemsController < ApplicationController
  def index
    @list = List.find(params[:list_id])
  end

  def new
    @list = List.find(params[:list_id])
    @item = @list.items.new
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.new(item_params)
    if @item.save
      flash[:success] = "Added list item."
      redirect_to list_items_path
    else
      flash[:error] = "There was a problem adding that list item."
      render action: :new
    end
  end

  private
  def item_params
    params[:item].permit(:content)
  end
end
