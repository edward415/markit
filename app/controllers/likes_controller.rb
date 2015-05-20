class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @topic = Topic.find(params[:topic_id])
    like = current_user.likes.build(bookmark: @bookmark)
    
    if like.save
      flash[:notice] = "Bookmark liked."
      redirect_to @topic
    else
      flash[:alert] = "Failed to like bookmark."
      redirect_to @topic
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @topic = Topic.find(params[:topic_id])
    like = current_user.likes.find(params[:id])
    
    if like.destroy
      flash[:notice] = "Bookmark unliked."
      redirect_to @topic
    else
      flash[:alert] = "Failed to unlike bookmark."
      redirect_to @topic
    end
  end
end
