class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.where(list_id: @list.id)

    # @review = Review.new
    # @reviews = @restaurant.reviews
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
