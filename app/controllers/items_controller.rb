class ItemsController < ApplicationController
  def index
    @list = List.find(params[:list_id])
  end
end
