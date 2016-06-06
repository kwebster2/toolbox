class Subject < ActiveRecord::Base
  belongs_to :category
  has_many   :resources
  has_many   :tags, through: :resources
  include Slugify

  before_create :to_slug

end
