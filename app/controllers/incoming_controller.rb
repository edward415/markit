class IncomingController < ApplicationController
  #   create_table "bookmarks", force: true do |t|
  #   t.string   "url"
  #   t.integer  "topic_id"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end

  # add_index "bookmarks", ["topic_id"], name: "index_bookmarks_on_topic_id"

  # create_table "topics", force: true do |t|
  #   t.string   "title"
  #   t.integer  "user_id"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end

  # add_index "topics", ["user_id"], name: "index_topics_on_user_id"

  # create_table "users", force: true do |t|
  #   t.string   "email",                  default: "", null: false
  #   t.string   "encrypted_password",     default: "", null: false
  #   t.string   "reset_password_token"
  #   t.datetime "reset_password_sent_at"
  #   t.datetime "remember_created_at"
  #   t.integer  "sign_in_count",          default: 0,  null: false
  #   t.datetime "current_sign_in_at"
  #   t.datetime "last_sign_in_at"
  #   t.string   "current_sign_in_ip"
  #   t.string   "last_sign_in_ip"
  #   t.string   "confirmation_token"
  #   t.datetime "confirmed_at"
  #   t.datetime "confirmation_sent_at"
  #   t.string   "unconfirmed_email"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  #   t.string   "name"
  # end

skip_before_action :verify_authenticity_token, only: [:create]

  def create
    
    @user = User.where(email: params['sender']).first
    if !@user.nil
      @topic = Topic.where(title: params[:subject]).first_or_create
      url = params['stripped-text']
      @bookmark = @topic.bookmarks.create!(url: url, topic_id: @topic.id, user_id: @user.id)
    end

    head 200
  end

end