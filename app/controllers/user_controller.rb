class UserController < ApplicationController
  def show
    @bookmarks = User.bookmarks
    @likes = User.likes
    @topic = User.topics
  end
end
