class AddReferencesToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :user, index: true
    add_reference :likes, :bookmark, index: true
  end
end
