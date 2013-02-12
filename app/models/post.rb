class Post < ActiveRecord::Base
  attr_accessible :blog_id, :content, :titel

  belongs_to :blog
  scope :latest, order("updated_at DESC").limit(3)
end
