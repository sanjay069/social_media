class LikesController < ApplicationController
  def index
    @user = current_user
    @friends = Friend.all
  end

  def create
    @friends = Friend.find(params[:friend_id])
    @friends.likes.create(friend_id: @friends)
    UserMailer.with(friend: @friends).welcome_email.deliver_later
    render json: { message: "like"}
  end

  def destroy
    @friends = Friend.find(params[:friend_id])
    @friends.likes.find_by(params[:id]).destroy
    UserMailer.with(friend: @friends).dislike.deliver_later
    render json: { message: "dislike"}
  end
end
