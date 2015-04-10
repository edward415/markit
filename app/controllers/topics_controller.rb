class TopicsController < ApplicationController
  def index
    @topic = current_user.topics
  end

  def show
    @bookmarks = current_user.topics.bookmarks.where("topic_id == ?", params[:topic_id])
  end

  def edit
  end

  def new
  end
end
