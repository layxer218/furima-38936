class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explane, :category_id, :item_state_id, :charge_id, :area_id, :deliver_day_id, :price).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end

end
