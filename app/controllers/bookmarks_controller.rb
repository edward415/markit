class BookmarksController < ApplicationController
  
  def new
    @topic = Topic.find(params[:topic_id])
    @new_bookmark = Bookmark.new
    
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = current_user.bookmarks.build(bookmark_params)
    @bookmark.topic = @topic
    
    if @bookmark.save
      flash[:notice] = "Bookmark was successfully saved"
      redirect_to(@topic)
    else
      flash[:error] = "Failed to create bookmark, please try again"
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Bookmark was successfully removed"
      redirect_to(@topic)
    else
      flash[:error] = "Bookmark was not destroyed, please try again"
      render :show
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark was successfully updated"
      redirect_to topics_path
    else
      flash[:error] = "Failed to update bookmark, please try again"
      render new_topic_bookmark_path(@topic)
    end
  end
  
  private
  
  def bookmark_params
    params.require(:bookmark).permit(:url, :topic_id)
  end
  
end
