class WelcomeController < ApplicationController
  def index
    @recent = Post.published.limit(6)
  end
end
