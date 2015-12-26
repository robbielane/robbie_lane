class WelcomeController < ApplicationController
  def index
    @recent = Post.all.limit(6)
  end
end
