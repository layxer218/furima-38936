class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_session, only: [:edit]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  #def destroy
    #@item = Item.find(params[:id])
    #@item.destroy
    #redirect_to root_path
  #end
  
  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explane, :category_id, :item_state_id, :charge_id, :area_id, :deliver_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
