class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
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


  private

  def item_params
    params.require(:item).permit(:name, :explanation, :image, :price, :category_id, :item_condition_id, :postage_area_id, :postage_player_id, :preparation_day_id).merge(user_id: current_user.id)
  end
end
