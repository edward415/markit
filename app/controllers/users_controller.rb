class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_bookmarks = @user.bookmarks.includes( :topic )
    @liked_bookmarks = @user.likes.includes( bookmark:  :topic ).map(&:bookmark)
    authorize @user
  end
end
