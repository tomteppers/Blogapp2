class Blog < ActiveRecord::Base
  attr_accessible :description, :titel

  has_many :posts
  validates :titel, presence: true

end
