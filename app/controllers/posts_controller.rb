class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
      @comment = Comment.new
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Great success"
      redirect_to post_path(@post)
    else
      flash[:error] = "There was an error"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
