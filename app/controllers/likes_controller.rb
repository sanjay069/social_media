class LikesController < ApplicationController
  def index
    @user = current_user
    @friends = Friend.all
  end

  def create
    @friends = Friend.find(params[:friend_id])
    @friends.likes.create(friend_id: @friends)
    UserMailer.with(friend: @friends).welcome_email.deliver_later
  end

  # def destroy
  #   @friends = Friend.find(params[:project_id])
  #   like = Like.find(params[:id])
  #   like.destroy
  #   respond_to do |format|
  #     format.html { redirect_to project_path(@friends), :notice => "Unliked!" }
  #     format.js { render '/projects/show.js.erb' }
  #     format.json { render '@friends' }
  #   end
  # end
end
