class WelcomeController < ApplicationController
  def index
    @recent = Post.published.limit(3)
  end
end
