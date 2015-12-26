class PostsController < ApplicationController
  before_action :authenticate!, only: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Succesfully created #{@post.title}"
      redirect_to posts_path
    else
      flash.now[:error] = "Something went wrong :("
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authenticate!
    redirect_to root_path unless current_user
  end
end
