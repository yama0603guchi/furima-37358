class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_message, only: [:show, :edit, :update]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def edit
    if @item.order.present?
      redirect_to action: :index
    end
    redirect_to action: :index unless current_user.id == @item.user.id
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user == current_user
       item.destroy
    redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :image, :price, :category_id, :item_condition_id, :postage_area_id,
                                 :postage_player_id, :preparation_day_id).merge(user_id: current_user.id)
  end

  def set_message
    @item = Item.find(params[:id])
  end
end
