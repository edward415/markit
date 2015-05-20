class UserController < ApplicationController
  def show
    @user_bookmarks = User.bookmarks
    @liked_bookmarks = User.likes
  end
end
