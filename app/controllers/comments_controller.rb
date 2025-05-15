# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  def create
    friend = Friend.find(params[:friend_id])
    comment = friend.comments.create(body: params[:body])
    render json: comment
  end
end
