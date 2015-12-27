class PostsController < ApplicationController
  before_action :authenticate!, except: [:show, :index]

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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Succesfully updated #{@post.title}"
      redirect_to posts_path
    else
      flash.now[:error] = "Something went wrong :("
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_dashboard_path
  end

  def dashboard
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authenticate!
    redirect_to root_path unless current_user
  end
end
