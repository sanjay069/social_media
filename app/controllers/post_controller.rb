class PostsController < ApplicationController
  load_and_authorize_resource
  skip_before_action :verify_authenticity_token

  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]

  def index
    @posts = Post.includes(:user, :photo_attachment, :image, :likes)
    @posts = @posts.where(user: current_user) if params[:my_posts]
    @posts = @posts.order(created_at: :desc)
    render json: @posts
  end

  def show
    # debugger
    @comments = @post.comments.includes(:user)
    # render json: @comments
    render json: @post
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      # render json: @post.comments
      # redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  #   authorize_user!
  # end

  def update
    # authorize_user!
    if @post.update(post_params)
      render json: @post
      # redirect_to @post, notice: "Post was successfully updated."
    else
      # render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize_user!
    @post.destroy
    format.json { head :no_content }
    # redirect_to posts_path, notice: "Post was successfully deleted."
  end



  def like
    @post = Post.find(params[:id])
    if @post.likes.exists?(user: current_user)
      @post.likes.find_by(user: current_user).destroy
    else
      @post.likes.create(user: current_user)
      # redirect_to posts_path
    end
    render json: @post.likes
    # redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :email, :phone, :image)
  end
end
