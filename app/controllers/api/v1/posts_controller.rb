class Api::V1::PostsController < Api::V1::BaseController
  def index
    respond_with Post.all
  end

  def show
    respond_with Post.find(params[:id])
  end
end
