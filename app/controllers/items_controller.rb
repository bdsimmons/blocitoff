class ItemsController < ApplicationController
  before_action :find_list

  def index
  end

  def new
    @list = List.find(params[:list_id])
    @item = @list.items.new
  end

  def create
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
    @item = @list.items.find(params[:id])
  end

  def update
    @item = @list.items.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "Saved list item."
      redirect_to list_items_path
    else
      flash[:error] = "That list item could not be saved."
      render action: :edit
    end
  end

  def destroy
    @item = @list.items.find(params[:id])
    if @item.destroy
      flash[:success] = "List item was deleted."
    else
      flash[:error] = "List item could not be deleted."
    end
    redirect_to list_items_path
  end

  def url_options
    { list_id: params[:list_id] }.merge(super)
  end

  private
  def find_list
    @list = List.find(params[:list_id])
  end

  def item_params
    params[:item].permit(:content)
  end
end
