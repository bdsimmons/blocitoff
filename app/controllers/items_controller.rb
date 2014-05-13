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

  def edit
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "Saved list item."
      redirect_to list_items_path
    else
      flash[:error] = "That list item could not be saved."
      render action: :edit
    end
  end

  def url_options
    { list_id: params[:list_id] }.merge(super)
  end

  private
  def item_params
    params[:item].permit(:content)
  end
end
