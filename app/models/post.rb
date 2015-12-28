class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  before_validation :create_slug

  enum status: %w(published pending)

  default_scope { order('created_at DESC')}
  scope :published, -> { where(status: 'published') }

  def create_slug
    self.slug = self.title.parameterize
  end
end
