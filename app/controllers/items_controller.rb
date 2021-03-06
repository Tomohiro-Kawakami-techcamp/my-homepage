class ItemsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  items_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to  item_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to  items_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :concept, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end