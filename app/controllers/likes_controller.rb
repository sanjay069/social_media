class LikesController < ApplicationController
  def index
    @user = current_user
    @projects = Project.all
  end

  def create
    @project = Project.find(params[:project_id])
    Like.create(:project => @project, :user => current_user)
    respond_to do |format|
      format.html { redirect_to project_path(@project), :notice => "Liked!" }
      format.js { render '/projects/show.js.erb' }
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    like = Like.find(params[:id])
    like.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project), :notice => "Unliked!" }
      format.js { render '/projects/show.js.erb' }
    end
  end
end