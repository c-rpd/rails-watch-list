class BookmarksController < ApplicationController
  def new
    # recuperer la liste
    @list = List.find(params[:list_id])
    # crée new bookmark
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(params_bookmark)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private
  def params_bookmark
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
