class Api::V1::PostsController < Api::V1::BaseController
  before_filter :restrict_access, only: [:create]

  def index
    respond_with Post.all
  end

  def show
    respond_with Post.find(params[:id])
  end

  def create
    respond_with Post.create(title: params[:title], body: params[:body])
  end

  private

  def restrict_access
    api_key = ApiKey.find_by(access_token: params[:access_token])
    head :unauthorized unless api_key
  end
end
