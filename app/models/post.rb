class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  before_validation :create_slug

  def create_slug
    self.slug = self.title.parameterize
  end
end
