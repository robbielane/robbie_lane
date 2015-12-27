class Post < ActiveRecord::Base
  before_validation :create_slug

  def create_slug
    self.slug = self.title.parameterize
  end
end
