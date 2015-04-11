class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def new
    @new_topic= Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "Topic was successfully created"
      redirect_to topics_path
    else
      flash[:error] = "Error creating topic, please try again"
      render :create
    end
  end
  
  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      flash[:notice] = "Topic was successfully updated"
      redirect_to topics_path
    else
      flash[:error] = "Error updating topic, please try again"
      render :edit
    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "Topic was successfully destroyed"
      redirect_to topics_path
    else
      flash[:error] = "Error deleting topic, please try again"
      render :show
    end
  end
  
  private
  
  def topic_params
    params.require(:topic).permit(:title)
  end
  
end
