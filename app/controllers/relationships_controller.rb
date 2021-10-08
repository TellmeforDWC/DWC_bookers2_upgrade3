class RelationshipsController < ApplicationController

  def create
    follow = Relationship.new
    user = User.find(params[:user_id])
    follow.following_id = user.id
    follow.followed_id = current_user.id
    follow.save
    redirect_back fallback_location: "books_path"
  end

  def destroy
    user = User.find(params[:user_id])
    follow = Relationship.find_by(following_id: user.id, followed_id: current_user.id)
    follow.destroy
    redirect_back fallback_location: "books_path"
  end

  def show_followees
    @user = User.find(params[:user_id])
  end

  def show_followers
    @user = User.find(params[:user_id])
  end

end
